<template>
  <div class="dashboard">
    <h3 class="subheading grey--text">Lưu trữ</h3>

    <v-container class="my-5" style="max-width:900px">
      
      <v-card flat v-for="(passport, index) in passports" :key="passport.title">
        <v-layout row wrap :class="`pa-3 passport ${passport.trangthai}`">
          <v-flex xs6 sm4 md3>
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
          <v-flex xs6 sm4 md1>
            <div class="right">
              <v-btn x-small icon fab color="teal" 
                @click="archive(passport, true, index)"
                v-tooltip="{ content: 'Lưu trữ' }"
              >
                <v-icon>mdi-check-outline</v-icon>
              </v-btn>
              <v-btn x-small icon fab color="red" 
                @click="archive(passport, false, index)"
                v-tooltip="{ content: 'Xóa hộ chiếu' }"
              >
                <v-icon>mdi-close-outline</v-icon>
              </v-btn>
            </div>
          </v-flex>
        </v-layout>
        <v-divider></v-divider>
      </v-card>
      <Pagination :page.sync="page" :totalPage="totalPage" />
    </v-container>

    <Snackbar :snackbar="snackbar" :snackbar_props="snackbar_props" />
  </div>
</template>

<script>
import PassportServices from '@/services/PassportServices'
import {AdminMixin} from '@/mixin/AdminMixin'

export default {
  mixins: [AdminMixin],
  components: {
    Snackbar: () => import('@/components/Snackbar'),
    Pagination: () => import('@/components/Pagination')
  },
  data () {
    return {
      status: 'lt'
    }
  },
  methods: {
    async archive(passport, isArchive, index) {
      let status = ''
      try {
        if (isArchive) {
          status = 'gs archived'
        }
        else {
          status = 'gs deleted'
          this.passports.splice(index, 1)
        }
        passport.trangthai = status
        PassportServices.archive(passport.id, {isArchive, status})
      } 
      catch (error) {
        this.error = error.response.data.error
      }
    },
  }
}
</script>

<style>
.passport.approved{
  border-left: 4px solid #3cd1c2;
}
.passport.archived{
  border-left: 4px solid #ffc70d;
}
.passport.canceled{
  border-left: 4px solid #f83e70;
}
.passport.deleted{
  border-left: 4px solid red;
}
div.right > .v-chip.approved{
  background: #3cd1c2;
}
div.right > .v-chip.archived{
  background: #ffc70d;
}
div.right > .v-chip.canceled{
  background: #f83e70;
}
div.right > .v-chip.deleted{
  background: red;
}
</style>