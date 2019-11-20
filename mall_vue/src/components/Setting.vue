<template>
  <div>
    <el-col style="padding:10px" :span="16">
      <el-tabs tab-position="right" style="height: 200px;padding:10px">
        <el-tab-pane label="用户信息管理">
          <el-table type="card" :data="userTableData" stripe style="width: 100%">
            <el-table-column prop="user_name" label="用户名" width="180"></el-table-column>
            <el-table-column prop="introduce" label="介绍" width="180"></el-table-column>
            <el-table-column label="状态">
              <template slot-scope="scope">
                <el-button size="small">{{userStateMap[scope.row.permission]}}</el-button>
              </template>
            </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  v-if="scope.row.permission === 3"
                  @click="allowShop(scope.row)"
                  type="success"
                  size="small"
                >批准</el-button>
                <el-button
                  v-if="scope.row.permission !== 4"
                  @click="banUser(scope.row)"
                  type="danger"
                  size="small"
                >封禁</el-button>
                <el-button
                  v-if="scope.row.permission === 4"
                  @click="unBanUser(scope.row)"
                  type="success"
                  size="small"
                >解禁</el-button>
                <el-button @click="showUser(scope.row)" type="primary" size="small">查看</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="商家管理">
          <el-table type="card" :data="userShopTableData" stripe style="width: 100%">
            <el-table-column prop="user_name" label="用户名" width="180"></el-table-column>
            <el-table-column prop="shop_name" label="店铺名" width="180"></el-table-column>
            <el-table-column label="状态">
              <template slot-scope="scope">
                <el-button size="small">{{userStateMap[scope.row.permission]}}</el-button>
              </template>
            </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  v-if="scope.row.permission !== 4"
                  @click="banShop(scope.row)"
                  type="danger"
                  size="small"
                >封禁</el-button>
                <el-button
                  v-if="scope.row.permission === 4"
                  @click="unBanShop(scope.row)"
                  type="success"
                  size="small"
                >解禁</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="农产品分类管理">
          <el-button @click="unBanShop(scope.row)" type="success" size="small">添加一级分类</el-button>
          <el-collapse accordion>
            <el-collapse-item>
              <template slot="title">
                一致性 Consistency
                <i class="header-icon el-icon-info"></i>
              </template>
            </el-collapse-item>
          </el-collapse>
        </el-tab-pane>
        <el-tab-pane label="销售统计">销售统计</el-tab-pane>
      </el-tabs>
    </el-col>
    <el-dialog title="用户信息" :visible.sync="dialogFormVisible">
      <el-form :model="dialogData">
        <el-form-item label="用户名：" :label-width="formLabelWidth">
          <el-input v-model="dialogData.user_name" disabled></el-input>
        </el-form-item>
        <el-form-item label="用户简介：" :label-width="formLabelWidth">
          <el-input v-model="dialogData.introduce" disabled></el-input>
        </el-form-item>
        <el-form-item label="邮箱：" :label-width="formLabelWidth">
          <el-input v-model="dialogData.email" disabled></el-input>
        </el-form-item>
        <el-form-item label="权限：" :label-width="formLabelWidth">
          <el-input :placeholder="userStateMap[dialogData.permission]" disabled></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  GetUserList,
  UserGetShopAsk, //批准成为商家
  BanUser, //封禁用户
  UnBanUser //解禁用户
} from "../api/user_api";
import {
  banShop,
  unBanShop,
  GetShopList //获取店铺列表
} from "../api/goods_api";
import { mapState, mapMutations, mapActions } from "vuex";
export default {
  name: "setting",
  data() {
    return {
      dialogFormVisible: false,
      userTableData: [],
      dialogData: {},
      formLabelWidth: "120px",
      //用户权限map对象
      userStateMap: {
        0: "普通用户",
        1: "申请成为商家中",
        2: "管理员",
        3: "商家",
        4: "封禁中"
      },
      userShopTableData: []
    };
  },
  created() {
    //未登录跳转到首页
    if (!this.loginState) {
      this.$message.error("请登录");
      this.$router.push("/");
    } else {
      this.getUserTableData();
    }
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
    getUserTableData() {
      GetUserList()
        .then(res => {
          this.userTableData = res.data;
          this.userShopTableData = this.userTableData.filter(v => {
            return v.permission === 2 || v.permission === 3;
          });
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        });
    },
    //批准成为商家
    allowShop(data) {
      this.$confirm("确定批准该申请吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UserGetShopAsk({ params: { userId: data.user_id } })
            .then(res => {
              this.$message.success("已批准");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //封禁用户
    banUser(data) {
      this.$confirm("确定封禁该用户吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          BanUser({ params: { userId: data.user_id } })
            .then(res => {
              this.$message.success("已封禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //解禁用户
    unBanUser(data) {
      this.$confirm("确定解禁该用户吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UnBanUser({ params: { userId: data.user_id } })
            .then(res => {
              this.$message.success("已解禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    //查看用户
    showUser(data) {
      this.dialogData = data;
      this.dialogFormVisible = true;
    },
    //
    banShop(data) {
      this.$confirm("确定封禁该店铺吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UnBanUser({ params: { id: data.id } })
            .then(res => {
              this.$message.success("已封禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    },
    unBanShop(data) {
      this.$confirm("确定解禁该店铺吗", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          UnBanUser({ params: { id: data.id } })
            .then(res => {
              this.$message.success("已解禁");
              this.getUserTableData();
            })
            .catch(err => {
              this.$message.error("服务器跑丢了");
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "操作已取消"
          });
        });
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      goodsList: state => state.goodsList,
      allGoodsList: state => state.allGoodsList,
      firstSortList: state => state.firstSortList,
      secondSortList: state => state.secondSortList,
      thirdSortList: state => state.thirdSortList,
      shoppingCartInfo: state => state.shoppingCartInfo
    })
  }
};
</script>

<style scoped>
</style>