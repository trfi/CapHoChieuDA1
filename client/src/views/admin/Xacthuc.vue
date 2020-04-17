<template>
  <div class="dashboard">
    <h3 class="subheading grey--text">Xác thực</h3>

    <v-container class="my-5" style="max-width:900px">
      <v-card flat v-for="passport in passports" :key="passport.title">
        <v-layout row wrap :class="`pa-3 passport ${passport.trangthai}`">
          <v-flex xs6 sm4 md3>
            <div class="caption grey--text">Họ tên</div>
            <div>{{ passport.hoten }}</div>
          </v-flex>
          <v-flex xs3 sm3 md2>
            <div class="caption grey--text">Giới tính</div>
            <div>{{ passport.gioitinh }}</div>
          </v-flex>
          <v-flex xs6 sm3 md2>
            <div class="caption grey--text">CMND</div>
            <div>{{ passport.cmnd }}</div>
          </v-flex>
          <v-flex xs6 sm4 md2>
            <div class="caption grey--text">Địa chỉ thường trú</div>
            <div>{{ passport.dcthuongtru }}</div>
          </v-flex>
          <v-flex xs6 sm3 md2>
            <div class="right">
              <v-chip small v-bind:class="passport.trangthai" class="white--text my-2 caption">{{ passport.trangthai | changeStatus }}</v-chip>
            </div>
          </v-flex>
          <v-flex xs3 sm2 md1>
            <DialogPassportDetail :passport="passport" />
            <v-btn
              @click="authenticate(passport)" 
              icon x-small fab color="teal"
              v-tooltip="{ content: 'Xác thực' }"
            >
              <v-icon>mdi-book-search-outline</v-icon>
            </v-btn>
          </v-flex>
        </v-layout>
        <v-divider></v-divider>
      </v-card>
    </v-container>
    <div class="text-center ma-2">
      <Snackbar :snackbar="snackbar" :snackbar_props="snackbar_props" />
    </div>
  </div>
</template>

<script>
import PassportServices from '@/services/PassportServices'

export default {
  components: {
    DialogPassportDetail: () => import('@/components/admin/DialogPassportDetail'),
    Snackbar: () => import('@/components/Snackbar')
  },
  data () {
    return {
      passports: {},
      snackbar: false,
      snackbar_props: {},
      dialog: false
    }
  },
  filters: {
    changeText(str) {
      return str.normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .replace(/đ/g, 'd').replace(/Đ/g, 'D')
        .replace(/ /g, '-')
        .toLowerCase()
    },
    changeStatus(status) {
      if (status.includes('waiting')) return 'Chờ xác thực'
      else if (status.includes('completed')) return 'Đã xác thực'
      else if (status.includes('canceled')) return 'Không hợp lệ'
      else return ''
    }
  },
  methods: {
    async authenticate(passport) {
      try {
        const response = await PassportServices.authenticate(passport['id'])
        if (response.data.isAuthenticate == true) {
          passport['trangthai'] = 'xt completed'
          this.snackbar_props.text = 'Xác thực thành công'
          this.snackbar_props.color = '#3cd1c2'
          this.snackbar = true
        }
        else {
          passport['trangthai'] = 'xt canceled'
          this.snackbar_props.text = 'Xác thực không thành công. Thông tin không hợp lệ'
          this.snackbar_props.color = '#f83e70'
          this.snackbar = true
        }
      } catch (error) {
        this.error = error.response.data.error
      }
    },
  },
  async mounted () {   
    this.passports = (await PassportServices.getByStatus('xt')).data
  }
}
</script>

<style>
.passport.completed{
  border-left: 4px solid #3cd1c2;
}
.passport.waiting{
  border-left: 4px solid #ffaa2c;
}
.passport.canceled{
  border-left: 4px solid #f83e70;
}
div.right > .v-chip.completed{
  background: #3cd1c2;
}
div.right > .v-chip.waiting{
  background: #ffaa2c;
}
div.right > .v-chip.canceled{
  background: #f83e70;
}
</style>