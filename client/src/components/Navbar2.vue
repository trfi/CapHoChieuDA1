<template>
  <nav>
    <v-navigation-drawer
      app
      disable-route-watcher="false"
      v-model="drawer"
      color="teal"
      width="210px"
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
              <v-list-item-title>Application</v-list-item-title>
              <v-list-item-subtitle>Subtext</v-list-item-subtitle>
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

    <v-toolbar dense app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title class="text-uppercase grey--text">
        <span>Passport</span>
      </v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-heart</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-toolbar>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      drawer: false,
      clipped: false,
      items: [
        { icon: 'mdi-view-dashboard', title: 'Dashboard', route: '/admin' },
        { icon: 'mdi-account-search', title: 'Xác thực', route: '/admin/xacthuc' },
        { icon: 'mdi-account-check', title: 'Xét duyệt', route: '/admin/xetduyet' },
        { icon: 'mdi-passport', title: 'Nộp hộ chiếu', route: '/passport' },
      ]
    }
  }
}
</script>

<style>
</style>