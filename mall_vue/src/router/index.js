import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import MallMain from '../views/MallMain.vue'
import RightView from '../components/RightView.vue'
import GoodsList from '../components/GoodsList.vue'
import Setting from '../components/Setting.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    children: [
      {
        path: '',
        component: MallMain,
        children: [
          {
            path: '',
            component: RightView
          },
          {
            path: '',
            component: GoodsList
          },
          {
            path: '/setting',
            component: Setting
          }]
      }
    ]
  }
]

const router = new VueRouter({
  routes
})

export default router
