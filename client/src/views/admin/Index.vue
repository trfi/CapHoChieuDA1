<template>
  <v-app class="grey lighten-3">
    <dashboard-core-app-bar />

    <dashboard-core-view />
  </v-app>
</template>

<script>
  export default {
    name: 'DashboardIndex',
    components: {
      DashboardCoreAppBar: () => import('@/components/admin/Navbar'),
      DashboardCoreView: () => import('../admin/View'),
    },

    data: () => ({
    })
  }
</script>
