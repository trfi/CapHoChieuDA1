<template>
  <div class="dashboard">
    <h3 class="subheading grey--text">Xét duyệt</h3>

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
          <v-flex xs6 sm3 md2>
            <div class="caption grey--text">Địa chỉ thường trú</div>
            <div>{{ passport.dcthuongtru }}</div>
          </v-flex>
          <v-flex xs6 sm3 md2>
            <div class="right">
              <v-chip small v-bind:class="passport.trangthai" class="white--text my-2 caption">{{ passport.trangthai | changeStatus }}</v-chip>
            </div>
          </v-flex>
          <v-flex xs4 sm3 md1>
            <v-btn
              x-small icon fab color="teal"
              @click="approving(passport, true)"
              v-tooltip="{ content: 'Xét duyệt' }"
            >
              <v-icon>mdi-check-outline</v-icon>
            </v-btn>
            <v-btn
              x-small icon fab color="red"
              @click="approving(passport, false)"
              v-tooltip="{ content: 'Không xét duyệt' }"
            >
              <v-icon>mdi-close-outline</v-icon>
            </v-btn>
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
      status: 'xd',
    }
  },
  methods: {
    async approving(passport, isApproved) {
      let status = ''
      try {
        if (isApproved) {
          status = 'lt approved'
          this.snackbar_text = 'Xét duyệt thành công'
          this.snackbar_color = '#3cd1c2'
          this.snackbar = true
        }
        else {
          status = 'lt canceled'
          this.snackbar_text = 'Không duyệt thành công'
          this.snackbar_color = '#ffaa2c'
          this.snackbar = true
        }
        passport.trangthai = status
        PassportServices.approve(passport.id, {status, isApproved})
      } 
      catch (error) {
        this.error = error.response.data.error
      }
    },
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