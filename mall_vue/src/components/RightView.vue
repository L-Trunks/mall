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
            <el-button icon="el-icon-s-custom" size="small">个人中心</el-button>
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
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";

export default {
  name: "rightView",
  data() {
    return {
      imgList: [
        "../../assets/images/a1.jpg",
        "../../assets/images/a2.jpg",
        "../../assets/images/a3.jpg",
        "../../assets/images/a4.jpg"
      ],
      userUrl:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
    };
  },
  methods:{
    ...mapMutations([]),
    goSetting(){
      //跳转管理员设置页面
      this.$router.push('/setting')
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo
    })
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
</style>