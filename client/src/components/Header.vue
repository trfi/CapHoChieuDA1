<template>
  <v-img
      dark
      max-height="500px"
      src="../assets/passport_banner.jpg"
      class="image mb-10"
      transition="false"
    >
    <v-layout fill-height align-center>
      <v-container>
        <v-row align="center" justify="center" class="white--text">
          
          <v-col cols="12">
            <router-link to="/">
            <div class="display-2 font-weight-bold">CẤP HỘ CHIẾU</div>
            <div class="headline">ISSUING PASSPORTS</div>
            </router-link>
          </v-col>
          
        </v-row>
      </v-container>
    </v-layout>
  </v-img>
</template>

<script>
  export default {
    data: {
      home_path: '/'
    }
  }
</script>

<style>
  body {
    background-image: url('../assets/background.jpg');
    background-repeat: repeat;
  }
  a.router-link-active {
    text-decoration: none;
    color: white;
  }
</style>