<template>
  <div class="dashboard">
    <h3 class="subheading grey--text">Giám sát</h3>

    <v-container class="my-5" style="max-width:1000px">
      <v-card flat v-for="passport in passports" :key="passport.title">
        <v-layout row wrap :class="`pa-3 passport ${passport.trangthai}`">
          <v-flex xs6 sm5 md4>
            <div class="caption grey--text">Họ tên</div>
            <div>{{ passport.hoten }}</div>
          </v-flex>
          <v-flex xs3 sm2 md2>
            <div class="caption grey--text">Giới tính</div>
            <div>{{ passport.gioitinh }}</div>
          </v-flex>
          <v-flex xs6 sm4 md2>
            <div class="caption grey--text">CMND</div>
            <div>{{ passport.cmnd }}</div>
          </v-flex>
          <v-flex xs6 sm4 md2>
            <div class="caption grey--text">Địa chỉ thường trú</div>
            <div>{{ passport.dcthuongtru }}</div>
          </v-flex>
          <v-flex xs6 sm4 md2>
            <div class="right">
              <v-chip small v-bind:class="passport.trangthai" class="white--text my-2 caption">{{ passport.trangthai | changeStatus }}</v-chip>
            </div>
          </v-flex>
        </v-layout>
        <v-divider></v-divider>
      </v-card>
      <Pagination :page.sync="page" :totalPage="totalPage" />
    </v-container>
    
  </div>
</template>

<script>
import PassportServices from '@/services/PassportServices'
import {AdminMixin} from '@/mixin/AdminMixin'

export default {
  mixins: [AdminMixin],
  components: {
    Pagination: () => import('@/components/Pagination')
  },
  data () {
    return {
      role: ''
    }
  },
  async mounted () {
    this.role = localStorage.getItem('role')
  }
}
</script>

<style>
.passport.completed, .passport.approved {
  border-left: 4px solid #3cd1c2;
}
.passport.waiting {
  border-left: 4px solid #ffaa2c;
}
.passport.canceled {
  border-left: 4px solid #f83e70;
}
.passport.archived{
  border-left: 4px solid #ffc70d;
}
div.right > .v-chip.completed, div.right > .v-chip.approved {
  background: #3cd1c2;
}
div.right > .v-chip.waiting{
  background: #ffaa2c;
}
div.right > .v-chip.canceled{
  background: #f83e70;
}
div.right > .v-chip.archived{
  background: #ffc70d;
}
</style>