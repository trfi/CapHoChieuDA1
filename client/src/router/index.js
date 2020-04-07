import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

const routes = [
  {
    path: '/admin/dashboard/',
    component: () => import('@/views/admin/Index'),
    children: [
      {
        name: 'Dashboard',
        path: 'index',
        component: () => import('@/views/admin/Dashboard'),
      },
      {
        name: 'Xacthuc',
        path: 'xacthuc',
        component: () => import('@/views/admin/Xacthuc'),
      },
      {
        name: 'Xetduyet',
        path: 'xetduyet',
        component: () => import('@/views/admin/Xetduyet'),
      },
      {
        name: 'Luutru',
        path: 'luutru',
        component: () => import('@/views/admin/Luutru'),
      }
    ]
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/passport',
    name: 'Passport',
    component: () => import('@/views/Passport')
  },
  {
    path: '/admin/login',
    name: 'Login',
    component: () => import('@/views/admin/Login'),
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
