<template>
  <v-content>
    <v-navigation-drawer
      app
      disable-route-watcher
      v-model="drawer"
      dark
      >
        <v-list
          dense
          nav
          class="py-0"
        >
          <v-list-item two-line class="px-0">
            <v-list-item-avatar>
              <img src="https://randomuser.me/api/portraits/men/81.jpg">
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>{{ email }}</v-list-item-title>
              <v-list-item-subtitle>{{ role }}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>

          <v-divider></v-divider>

          <v-list-item
            v-for="item in items"
            :key="item.title"
            :to="item.route"
            link
          >
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>

    
    <v-app-bar dense app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title class="text-uppercase grey--text">
        <span>Dashboard</span>
      </v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-heart</v-icon>
      </v-btn>

      <v-btn icon @click="logout">
        <v-icon>mdi-logout</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-app-bar>
    
  </v-content>
</template>

<script>
export default {
  data () {
    return {
      drawer: true,
      clipped: false,
      items: [
        { icon: 'mdi-view-dashboard', title: 'Dashboard', route: '/admin/dashboard/index' },
        { icon: 'mdi-account-search', title: 'Xác thực', route: '/admin/dashboard/xacthuc' },
        { icon: 'mdi-account-check', title: 'Xét duyệt', route: '/admin/dashboard/xetduyet' },
        { icon: 'mdi-content-save-all', title: 'Lưu trữ', route: '/admin/dashboard/luutru' }
      ],
      email: '',
      role: ''
    }
  },
  methods: {
    logout () {
      this.$store.dispatch('setToken', null)
      this.$store.dispatch('setUser', null)
      localStorage.removeItem('user')
      localStorage.removeItem('role')
      localStorage.removeItem('isUserLoggedIn')
      //window.location.href = '/admin/login'
      this.$router.push({
        path: '/admin/login'
      })
    }
  },
  mounted () {
    this.role = localStorage.getItem('role')
    this.email = localStorage.getItem('user')
    if (this.role == 'XT') {
      this.items.splice(3, 1)
      this.items.splice(2, 1)
    }
    else if (this.role == 'XD') {
      this.items.splice(3, 1)
      this.items.splice(1, 1)
    }
    else if (this.role == 'LT') {
      this.items.splice(2, 1)
      this.items.splice(1, 1)
    }
  }
}
</script>

<style>
</style>