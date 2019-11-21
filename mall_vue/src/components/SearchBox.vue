<template>
  <div>
    <el-col class="search" :span="20" :offset="2">
      <router-link to="/">
        <div class="search_left">
          <h2>农产品商城</h2>
          <span>Agricultural Products Mall</span>
        </div>
      </router-link>
      <div class="search_center">
        <el-input placeholder="在此搜索" clearable v-model="searchs" style="width:280px"></el-input>
        <el-button type="success" @click="goSearchResult" icon="el-icon-search">搜索</el-button>
      </div>
      <el-badge :value="shoppingCartInfo&&shoppingCartInfo.length || 0" class="search_right">
        <el-button size="small" @click="goShopCart" icon="el-icon-shopping-cart-2">购物车</el-button>
      </el-badge>
    </el-col>
    <el-drawer title="购物车" :visible.sync="drawer" direction="ttb" :before-close="handleClose">
      <el-checkbox-group
        class="cart_list"
        v-model="checkedGoods"
        @change="handleCheckedCitiesChange"
      >
        <el-checkbox
          :label="item.now_price*item.count"
          :false-label="0"
          class="cart_item"
          v-for="(item,index) in shoppingCartInfo"
          :key="item.total"
        >
          <div>
            <img width="80px" height="80px" :src="item.goods_img" alt="..." />
            商品名
            <el-input style="width:240px" v-model="item.goods_name" disabled></el-input>
            <el-input-number style="width:120px" disabled v-model="item.count" :min="1"></el-input-number>单价：
            <el-input style="width:80px" v-model="item.now_price" disabled></el-input>总计：
            <el-input style="width:80px" v-model="item.now_price*item.count" disabled></el-input>
          </div>
        </el-checkbox>
      </el-checkbox-group>

      <div class="cart_btn">
        合计：{{totalMoney}}
        <el-button size="small" @click="buyShopCart" type="danger" icon>立即结算</el-button>
        <el-button size="small" @click="drawer = false" type="info">退出</el-button>
      </div>
    </el-drawer>
    <el-dialog title="确认订单" :visible.sync="dialogFormVisible">
      <el-form v-loading="loading" :model="orderForm">
        <el-form-item label="商品名称：">
          <el-input v-model="orderForm.goods_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="发货地：">
          <el-input v-model="orderForm.sendPlace" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item required label="收货地：">
          <el-input v-model="orderForm.achievePlace" autocomplete="off"></el-input>
          <!-- <el-cascader v-model="orderForm.achievePlace" :options="options"></el-cascader> -->
        </el-form-item>
        <el-form-item label="收货人：">
          <el-input v-model="orderForm.userName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号：">
          <el-input v-model="orderForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="总价">
          <el-input v-model="orderForm.priceTotal" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="danger" @click="createOrder">结算</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import { ShoppingCartList, CreateOrder } from "../api/goods_api";
export default {
  name: "searchBox",
  data() {
    return {
      dialogFormVisible: false,
      drawer: false,
      searchs: "",
      totalMoney: 0,
      orderForm: {},
      checkedGoods: [],
      loading: false
    };
  },
  methods: {
    ...mapActions(["getGoodsById", "shoppingCartList"]),
    ...mapMutations(["changeSearch"]),
    goSearchResult() {
      this.changeSearch(this.searchs);
      this.$router.push({ path: "/search_result", query: { search: this.searchs } });
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    },
    //复选框改变事件
    handleCheckedCitiesChange() {
      console.log(this.checkedGoods);
      this.totalMoney = eval(this.checkedGoods.join("+"));
    },
    handleChange() {},
    buyShopCart() {
      console.log(this.goodsInfo, this.userInfo);
      if (this.totalMoney == 0) {
        this.$message.error("请选择商品");
        return;
      } else {
        this.orderForm = {
          goods_name: this.goodsInfo[0].goods_name,
          goodsId: this.goodsInfo[0].id,
          sendPlace: this.goodsInfo[0].send_palce,
          achievePlace: "",
          sendId: this.goodsInfo[0].user_id,
          achieveId: this.userId,
          priceTotal: this.totalMoney,
          userName: this.userInfo[0].user_name,
          phone: this.userInfo[0].phone
        };
        this.dialogFormVisible = true;
      }
    },
    goShopCart() {
      if (!this.loginState) {
        this.$message.error("请在左上角登录");
        return;
      } else {
        this.drawer = true;
        console.log(this.shoppingCartInfo);
        this.shoppingCartInfo.map(v => {
          v.total = v.count * v.now_price;
        });
      }
    },
    createOrder() {
      this.loading = true;
      CreateOrder({ params: this.orderForm })
        .then(res => {
          console.log(res);
          setTimeout(() => {
            this.$message.success("购买成功");
            this.loading = false;
            this.dialogFormVisible = false;
          }, 2000);
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    }
  },
  computed: {
    ...mapState({
      goodsInfo: state => state.goodsInfo,
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      shoppingCartInfo: state => state.shoppingCartInfo
    })
  },
  watch: {
    shoppingCartInfo: {
      handler(newval) {
        newval.map(v => {
          v.total = v.count * v.now_price;
        });
      }
    }
  }
};
</script>

<style scoped>
.search_box {
  background: #fff;
}
.search {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  padding: 20px;
  border-bottom: 2px solid #67c23a;
}
.search_left {
  color: #67c23a;
}
.cart_list {
  display: flex;
  flex-direction: column;
  padding-left: 50px;
}
.cart_btn {
  position: absolute;
  bottom: 10px;
  right: 20px;
}
.cart_item {
  margin-top: 10px;
  display: flex;
  width: 80%;
  flex-direction: row;
  justify-content: space-between;
}
</style>