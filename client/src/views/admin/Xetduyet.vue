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

    </v-container>
    <div class="text-center ma-2">
      <v-snackbar
        v-model="snackbar"
        top
        :color="snackbar_color"
      >
        {{ snackbar_text }}
        <v-btn
          color="black"
          text
          @click="snackbar = false"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-snackbar>
    </div>
  </div>
</template>

<script>
import PassportServices from '@/services/PassportServices'

export default {
  data () {
    return {
      passports: {},
      isApproved: false,
      snackbar: false,
      snackbar_text: '',
      snackbar_color: ''
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
      if (status.includes('waiting')) return 'Chờ xét duyệt'
      else if (status.includes('complete')) return 'Đã xét duyệt'
      else if (status.includes('cancel')) return 'Không xét duyệt'
      else return ''
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
  },
  async mounted () {   
    this.passports = (await PassportServices.getByStatus('xd')).data
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