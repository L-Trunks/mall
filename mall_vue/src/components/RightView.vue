<template>
  <div>
    <el-col style="padding:10px" :span="12">
      <el-carousel height="300px">
        <el-carousel-item v-for="item in imgList" :key="item">
          <img :src="item" width="100%" height="100%" alt srcset />
        </el-carousel-item>
      </el-carousel>
    </el-col>
    <el-col :span="4">
      <el-card style="margin-top:10px" shadow="hover">
        <div class="card_box">
          <div class="card_img">
            <el-avatar :size="60" :src="userUrl"></el-avatar>
          </div>
          <el-button
            icon="el-icon-s-promotion"
            size="small"
            style="margin-top:30px"
            v-if="!loginState"
            @click="()=>{this.$message.error('请在左上角登录')}"
          >未登录</el-button>
          <div v-if="loginState" class="card_btn">
            <el-button icon="el-icon-s-custom" @click="drawer = true" size="small">个人中心</el-button>
            <el-button
              v-if="userInfo&&userInfo[0].permission == 2"
              icon="el-icon-s-cooperation"
              size="small"
              @click="goSetting"
            >管理员端</el-button>
          </div>
          <el-badge v-if="loginState" :value="0" class="card_shop">
            <el-button size="small" icon="el-icon-s-shop">我的店铺</el-button>
          </el-badge>
        </div>
      </el-card>
    </el-col>
    <el-drawer
      class="person_center"
      title="个人中心"
      :visible.sync="drawer"
      direction="rtl"
      :before-close="handleClose"
    >
      <el-form label-position="right" label-width="80px" :model="userInfoForm">
        <el-form-item label="用户名">
          <el-input v-model="userInfoForm.userName" :disabled="!isEdit"></el-input>
        </el-form-item>
        <el-form-item label="个人简介">
          <el-input v-model="userInfoForm.introduce" :disabled="!isEdit"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="userInfoForm.email" :disabled="!isEdit"></el-input>
        </el-form-item>
      </el-form>
      <el-button size="small" @click="isEdit = true" icon="el-icon-edit">编辑个人信息</el-button>
      <el-button size="small" v-if="isEdit" @click="updateUserInfo" type="success">提交</el-button>
      <el-button size="small" icon="el-icon-s-shop">发布商品</el-button>
      <el-button size="small" @click="dialogFormVisible = true" icon>我的店铺</el-button>
      <div style="padding:10px">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>我的订单</span>
          </div>
          <el-collapse v-model="activeName" accordion>
            <el-collapse-item
              v-for="(item,index) in orderInfo"
              :title="'订单号'+item.order_number"
              :name="index"
            >
              <div>商品名称{{item.goods_name}}</div>
              <div>发货地{{item.send_place}}</div>
              <div>收货地{{item.achieve_place}}</div>
              <div>订单总价{{item.price_tatal}}</div>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </div>
    </el-drawer>
    <el-dialog title="我的店铺" :visible.sync="dialogFormVisible">
      <el-table :data="shopGoodsList" style="width: 100%" height="500">
        <el-table-column prop="goods_name" label="商品名称" width="120"></el-table-column>
        <el-table-column prop="price" label="原价" width="120"></el-table-column>
        <el-table-column prop="now_price" label="现价" width="120"></el-table-column>
        <el-table-column prop="send_palce" label="发货地" width="120"></el-table-column>
        <el-table-column prop="sort_name" label="商品分类" width="120"></el-table-column>
        <el-table-column label="商品状态" width="120">
          <template slot-scope="scope">{{ goodsStateMap[scope.row.is_shop ]}}</template>
        </el-table-column>
        <el-table-column prop="goods_name" label="操作" fixed="right" width="160">
          <template slot-scope="scope">
            <el-button
              v-if="scope.row.is_shop == 0"
              size="mini"
              type="success"
              @click="goodsAddShop(scope.row.id)"
            >上架</el-button>
            <el-button
              v-if="scope.row.is_shop == 1"
              size="mini"
              type="danger"
              @click="goodsRemoveShop(scope.row.id)"
            >下架</el-button>

            <el-button
              size="mini"
              type="primary"
              @click="updateGoodsPrice(scope.row)"
              slot="reference"
            >改价</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="danger" @click="dialogFormVisible = false">确定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="我的店铺" :visible.sync="visible">
      <div slot="footer" class="dialog-footer">
        <el-form :model="form">
          <el-form-item label="输入价格">
            <el-input v-model="form.now_price" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <el-button @click="visible = false">取 消</el-button>
        <el-button type="danger" @click="updateGoods">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
import { UpdateUserInfo } from "../api/user_api";
import {
  GetGoodsByShop,
  GoodsAddShop,
  GoodsRemoveShop,
  UpdateGoodsPrice
} from "../api/goods_api";
export default {
  name: "rightView",
  data() {
    return {
      form: {},
      visible: false,
      isShopMap: {
        0: false,
        1: true
      },
      goodsStateMap: {
        0: "已下架",
        1: "已上架"
      },
      dialogFormVisible: false,
      activeNamel: "first",
      drawer: false,
      isEdit: false,
      activeName: 0,
      imgList: [
        "../../assets/images/a1.jpg",
        "../../assets/images/a2.jpg",
        "../../assets/images/a3.jpg",
        "../../assets/images/a4.jpg"
      ],
      userInfoForm: {},
      userUrl:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
      shopGoodsList: []
    };
  },
  created() {
    this.setUserInfo();
  },
  methods: {
    //改价请求
    updateGoods() {
      UpdateGoodsPrice({ params: this.form })
        .then(res => {
          console.log(res);
          this.$message.success("修改成功");
          this.visible = false;
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    //改价
    updateGoodsPrice(data) {
      this.form = {
        nowPrice: data.now_price,
        goodsId: data.id
      };
      this.visible = true;
    },
    //上架
    goodsAddShop(id) {
      GoodsAddShop({ params: { goodsId: id } })
        .then(res => {
          console.log(res);
          this.$message.success("上架成功");
          this.setUserInfo();
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    //下架
    goodsRemoveShop(id) {
      GoodsRemoveShop({ params: { goodsId: id } })
        .then(res => {
          console.log(res);
          this.$message.success("下架成功");
          this.setUserInfo();
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    //设置个人信息
    setUserInfo() {
      console.log(this.userInfo);
      this.userInfo
        ? (this.userInfoForm = {
            ...this.userInfo[0],
            userName: this.userInfo[0].user_name,
            userId: this.userInfo[0].user_id
          })
        : "";
      console.log(this.userInfoForm);
      this.getOrderInfo({ userId: this.userId });
      GetGoodsByShop({ params: { shopId: this.userInfo && this.userInfo[0].id || 0} })
        .then(res => {
          console.log(res);
          this.shopGoodsList = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    updateUserInfo() {
      UpdateUserInfo({ params: this.userInfoForm })
        .then(res => {
          console.log(res);
          this.$message.success("修改成功");
          this.isEdit = false;
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    ...mapMutations([]),
    ...mapActions(["getOrderInfo"]),
    goSetting() {
      //跳转管理员设置页面
      this.$router.push("/setting");
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      orderInfo: state => state.orderInfo
    })
  },
  watch: {
    userInfo: {
      handler(newval) {
        this.setUserInfo();
      },
      deep: true
    }
  }
};
</script>

<style scoped>
.card_box {
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 5px;
}
.card_btn {
  margin-top: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.card_img {
  text-align: center;
}
.card_shop {
  margin-top: 15px;
  text-align: center;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}

.box-card {
  width: 480px;
}
.person_center {
  padding: 0 20px;
}
</style>