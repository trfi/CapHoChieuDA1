<template>
  <div class="dashboard">
    <h3 class="subheading grey--text">Xác thực</h3>

    <v-container class="my-5" style="max-width:900px">
      
      <v-card flat v-for="passport in passports" :key="passport.title">
        <v-layout row wrap :class="`pa-3 passport ${passport.tinhtrang}`">
          <v-flex xs12 md6>
            <div class="caption grey--text">Họ tên</div>
            <div>{{ passport.hoten }}</div>
          </v-flex>
          <v-flex xs6 sm4 md2>
            <div class="caption grey--text">CMND</div>
            <div>{{ passport.cmnd }}</div>
          </v-flex>
          <v-flex xs6 sm4 md2>
            <div class="caption grey--text">Giới tính</div>
            <div>{{ passport.gioitinh }}</div>
          </v-flex>
          <v-flex xs2 sm4 md2>
            <div class="right">
              <v-chip small  :class="`${passport.tinhtrang} white--text my-2 caption`">{{ passport.tinhtrang }}</v-chip>
            </div>
          </v-flex>
        </v-layout>
        <v-divider></v-divider>
      </v-card>

    </v-container>
   
  </div>
</template>

<script>
import PassportServices from '@/services/PassportServices'

export default {
  data () {
    return {
      passports: {},
    }
  },
  async mounted () {
    this.passports = (await PassportServices.getAll()).data
    console.log(this.passports)
  }
}
</script>

<style>
.passport.complete{
  border-left: 4px solid #3cd1c2;
}
.passport.waiting{
  border-left: 4px solid #ffaa2c;
}
.passport.cancel{
  border-left: 4px solid #f83e70;
}
div.right > .v-chip.complete{
  background: #3cd1c2;
}
div.right > .v-chip.waiting{
  background: #ffaa2c;
}
div.right > .v-chip.cancel{
  background: #f83e70;
}
</style>