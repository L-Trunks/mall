<template>
  <div class="home">
    <el-row class="search_box">
      <el-col class="search" :span="20" :offset="2">
        <div class="search_left">
          <h2>农产品商城</h2>
          <span>Agricultural Products Mall</span>
        </div>
        <!-- <img src="../assets/images/lo.jpeg" class="search_left" alt /> -->
        <div class="search_center">
          <el-input placeholder="在此搜索" v-model="search" style="width:280px"></el-input>
          <el-button type="success" icon="el-icon-search">搜索</el-button>
        </div>
        <el-badge :value="0" class="search_right">
          <el-button size="small" @click="goShopCart" icon="el-icon-shopping-cart-2">购物车</el-button>
        </el-badge>
      </el-col>
      <!-- 左边导航 -->
      <left-nav></left-nav>
      <router-view></router-view>
    </el-row>
  </div>
</template>

<script>
import {
  UserLogin,
  UserRegister,
  IsHasPhone,
  UserAddShop, //开通店铺
  GetUserInfo //获取用户信息
} from "../api/user_api";
import { mapState, mapMutations, mapActions } from "vuex";
import LeftNav from "../components/LeftNav";
import RightView from "../components/RightView";
export default {
  name: "mallMain",
  data() {
    return {
      search: ""
    };
  },
  created() {
  },
  methods: {
    ...mapMutations(["changeUserId", "changeLoginState", "changeUserInfo"]),
    ...mapActions([
      "getAllGoodsList",
      "getGoodsBySort",
      "getGoodsById",
      "getFirstSort",
      "getSecondSort",
      "getThirdSort",
      "shoppingCartList"
    ]),
    goShopCart() {
      if (!this.loginState) {
        this.$message.error("请在左上角登录");
        return;
      } else {
      }
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      goodsList: state => state.goodsList,
      goodsInfo: state => state.goodsInfo,
      allGoodsList: state => state.allGoodsList,
      firstSortList: state => state.firstSortList,
      secondSortList: state => state.secondSortList,
      thirdSortList: state => state.thirdSortList,
      shoppingCartInfo: state => state.shoppingCartInfo,
      isNav: state => state.isNav
    })
  },
  components: {
    LeftNav,
    RightView
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
</style>
