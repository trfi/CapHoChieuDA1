<template>
  <v-app>
  <v-content>
  <v-container style="max-width: 800px;">
    <h1 class="text-center">TỜ KHAI ĐIỆN TỬ</h1>
    <h5 class="text-center">(Dùng cho công dân Việt Nam đề nghị cấp, sửa đổi hộ chiếu phổ thông ở trong nước)</h5>
    <v-form
      ref="form"
      v-model="valid"
      lazy-validation
    >
      <v-row justify="space-between">
        <v-col md="7">
          <v-text-field
            autocomplete="on"
            v-model="hoten"
            :counter="10"
            :rules="nameRules"
            label="1. Họ và tên"
            required
          ></v-text-field>
        </v-col>
        <v-col md="4">
          <v-radio-group v-model="gioitinh" row label="2. Giới tính">
            <v-radio label="Nam" value="male"></v-radio>
            <v-radio label="Nữ" value="female"></v-radio>
          </v-radio-group>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col md="3">
          <v-menu
            v-model="menu1"
            :close-on-content-click="false"
            max-width="290"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                :value="computedDateFormattedMomentjs"
                clearable
                label="3. Ngày sinh"
                readonly
                v-on="on"
                @click:clear="ngaysinh = null"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="ngaysinh"
              @change="menu1 = false"
            ></v-date-picker>
          </v-menu>
        </v-col>
        <v-col md=3>
          <v-select
            :items="items"
            :rules="[v => !!v || 'Vui lòng chọn nơi sinh']"
            required
            label="Nơi sinh"
            v-model="noisinh"
            outlined
            dense
          ></v-select>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col md="4">
          <v-text-field
            v-model="cmnd"
            :rules="[
              v => !!v || 'Bạn chưa nhập số CMND',
              v => (v && v.length == 9 || v.length == 12 ) || 'Số CMND phải có hơn 9 hoặc 12 số',
            ]"
            label="4. Số CMND"
            required
          ></v-text-field>
        </v-col>

        <v-col md="3">
          <v-menu
            v-model="menu2"
            :close-on-content-click="false"
            max-width="290"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                :value="computedDateFormattedMomentjs2"
                clearable
                label="Ngày cấp"
                readonly
                v-on="on"
                @click:clear="ngaycap = null"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="ngaycap"
              @change="menu2 = false"
            ></v-date-picker>
          </v-menu>
        </v-col>

        <v-col cols="12" sm="3">
          <v-select
            :items="items"
            :rules="[v => !!v || 'Vui lòng chọn nơi cấp']"
            v-model="noicap"
            required
            label="Nơi cấp"
            outlined
            dense
          ></v-select>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col md="3">
          <v-text-field
            v-model="sodienthoai"
            :rules="[
              v => !!v || 'Bạn chưa nhập số Số điện thoại',
              v => (v && v.length == 10 ) || 'Số điện thoại phải có 10 số',
            ]"
            label="7. Số điện thoại"
            required
          ></v-text-field>
        </v-col>
        <v-col md="5">
          <v-text-field
            v-model="email"
            :rules="emailRules"
            label="Email"
            required
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col md="3">
          <v-select
            :items="items"
            :rules="[v => !!v || 'Vui lòng chọn dân tộc']"
            v-model="dantoc"
            required
            label="5. Dân tộc"
            outlined
            dense
          ></v-select>
        </v-col>
        <v-col md="3">
          <v-select
            :items="items"
            label="6. Tôn giáo"
            :rules="[v => !!v || 'Vui lòng chọn tôn giáo']"
            v-model="tongiao"
            required
            outlined
            dense
          ></v-select>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col md="5">
          <v-select
            :items="items"
            :rules="[v => !!v || 'Vui lòng chọn tỉnh/TP thường trú']"
            v-model="dcthuongtru"
            required
            label="8. Địa chỉ thường trú"
            outlined
            dense
          ></v-select>
        </v-col>
        <v-col md="4">
          <v-select
            :items="items"
            :rules="[v => !!v || 'Vui lòng chọn quận huyện thường trú']"
            v-model="quanhuyen"
            required
            label="Quận huyện"
            outlined
            dense
          ></v-select>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col>
          <v-text-field
            v-model="dcchitiet"
            label="Địa chỉ chi tiết"
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row
        align="center"
        justify="center"
      >
        <v-btn
          :disabled="!valid"
          color="primary"
          class="mr-4"
          @click="apply(); snackbar = true"
        >
          NỘP HỒ SƠ
        </v-btn>
      </v-row>
      <v-row>
        <br>
      </v-row>
      <v-row
        align="center"
        justify="center"
      >
      </v-row>
    </v-form>
  </v-container>
  </v-content>
  <div class="text-center">
    <v-snackbar
      top
      v-model="snackbar"
      :timeout="timeout"
    >
      {{ text }}
      <v-btn
        color="blue"
        text
        @click="snackbar = false"
      >
        Close
      </v-btn>
    </v-snackbar>
  </div>
  </v-app>
</template>

<script>
  import moment from 'moment'
  import PassportServices from '@/services/PassportServices'

  export default {
    data: () => ({
      hoten: "",
      gioitinh: "",
      noisinh: "",
      cmnd: "",
      noicap: "",
      sodienthoai: "",
      dantoc: "",
      tongiao: "",
      dcthuongtru: "",
      quanhuyen: "",
      dcchitiet: "",
      ngaysinh: new Date().toISOString().substr(0, 10),
      ngaycap: new Date().toISOString().substr(0, 10),
      menu1: false,
      menu2: false,
      valid: true,
      snackbar: false,
      text: 'Nộp hồ sơ thành công',
      timeout: 2000,
      nameRules: [
        v => !!v || 'Vui lòng nhập họ tên',
        v => (v && v.length > 5) || 'Họ và tên phải lớn 5 ký tự',
      ],
      email: '',
      emailRules: [
        v => !!v || 'Vui lòng nhập email',
        v => /.+@.+\..+/.test(v) || 'Email không đúng định dạng',
      ],
      select: null,
      items: [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
      ],
      checkbox: false,
    }),
    computed: {
      computedDateFormattedMomentjs () {
        return this.ngaysinh ? moment(this.ngaysinh).format('DD/MM/YYYY') : ''
      },
      computedDateFormattedMomentjs2 () {
        return this.ngaycap ? moment(this.ngaycap).format('DD/MM/YYYY') : ''
      },
    },
    methods: {
      async apply () {
        await PassportServices.apply({
          hoten: this.hoten,
          gioitinh: this.gioitinh,
          ngaysinh: this.ngaysinh,
          noisinh: this.noisinh,
          cmnd: parseInt(this.cmnd),
          ngaycap: this.ngaycap,
          noicap: this.noicap,
          sodienthoai: this.sodienthoai,
          email: this.email,
          dantoc: this.dantoc,
          tongiao: this.tongiao,
          dcthuongtru: this.dcthuongtru,
          quanhuyen: this.quanhuyen,
          dcchitiet: this.dcchitiet
        })
      },
      validate () {
        this.$refs.form.validate()
      }
    }
  }
</script>