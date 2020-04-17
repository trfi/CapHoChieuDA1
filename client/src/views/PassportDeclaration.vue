<template>
  <div>
  <Header />
  <v-container class="grey lighten-4 pa-10" style="max-width: 800px;">
    <h1 class="text-center">TỜ KHAI ĐIỆN TỬ</h1>
    <h5 class="text-center">(Dùng cho công dân Việt Nam đề nghị cấp, sửa đổi hộ chiếu phổ thông ở trong nước)</h5>
    <v-form
      ref="form"
      v-model="valid"
      lazy-validation
      class="my-10"
    >
      <v-row justify="space-between">
        <v-col md="6">
          <v-text-field
            autocomplete="on"
            v-model="hoten"
            :counter="10"
            :rules="nameRules"
            label="1. Họ và tên"
            required
          ></v-text-field>
        </v-col>
        <v-col md="5">
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

      <v-row justify="space-between">
        <v-col md="5">
          <v-select
            :items="items"
            v-model="dctamgtru"
            label="9. Địa chỉ tạm trú"
            outlined
            dense
          ></v-select>
        </v-col>
        <v-col md="4">
          <v-select
            :items="items"
            v-model="quanhuyen_tt"
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
            v-model="dcchitiet_tt"
            label="Địa chỉ chi tiết"
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col>
          <v-text-field
            v-model="nghenghiep"
            label="10. Nghề nghiệp"
          ></v-text-field>
        </v-col>
        <v-col>
          <v-text-field
            v-model="tendccoquan"
            label="11. Tên và địa chỉ cơ quan"
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col>
          <v-text-field
            v-model="hoten_cha"
            label="12. Họ tên cha"
          ></v-text-field>
        </v-col>
        <v-col md="3">
          <v-menu
            v-model="menu3"
            :close-on-content-click="false"
            max-width="290"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                :value="computedDateFormattedMomentjs3"
                clearable
                label="Ngày cấp"
                readonly
                v-on="on"
                @click:clear="ngaysinh_cha = null"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="ngaysinh_cha"
              @change="menu3 = false"
            ></v-date-picker>
          </v-menu>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col>
          <v-text-field
            v-model="hoten_me"
            label="Họ tên mẹ"
          ></v-text-field>
        </v-col>
        <v-col md="3">
          <v-menu
            v-model="menu4"
            :close-on-content-click="false"
            max-width="290"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                :value="computedDateFormattedMomentjs4"
                clearable
                label="Ngày cấp"
                readonly
                v-on="on"
                @click:clear="ngaysinh_me = null"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="ngaysinh_me"
              @change="menu4 = false"
            ></v-date-picker>
          </v-menu>
        </v-col>
      </v-row>

      <v-row justify="space-between">
        <v-col>
          <v-text-field
            v-model="hoten_vc"
            label="Họ tên Vợ/Chồng"
          ></v-text-field>
        </v-col>
        <v-col md="3">
          <v-menu
            v-model="menu5"
            :close-on-content-click="false"
            max-width="290"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                :value="computedDateFormattedMomentjs5"
                clearable
                label="Ngày sinh"
                readonly
                v-on="on"
                @click:clear="ngaysinh_vc = null"
              ></v-text-field>
            </template>
            <v-date-picker
              v-model="ngaysinh_vc"
              @change="menu5 = false"
            ></v-date-picker>
          </v-menu>
        </v-col>
      </v-row>

      <v-row
        align="center"
        justify="center"
        class="mt-10"
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
      <v-row
        align="center"
        justify="center"
      >
      </v-row>
    </v-form>
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
  </v-container>
  </div>
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
      dctamtru: "",
      quanhuyen_tt: "",
      dcchitiet_tt: "",
      nghenghiep: "",
      tendccoquan: "",
      hoten_cha: "",
      hoten_me: "",
      hoten_vc: "",
      ngaysinh_cha: new Date().toISOString().substr(0, 10),
      ngaysinh_me: new Date().toISOString().substr(0, 10),
      ngaysinh_vc: new Date().toISOString().substr(0, 10),
      ngaysinh: new Date().toISOString().substr(0, 10),
      ngaycap: new Date().toISOString().substr(0, 10),
      menu1: false,
      menu2: false,
      menu3: false,
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
      computedDateFormattedMomentjs3 () {
        return this.ngaysinh_cha ? moment(this.ngaysinh_cha).format('DD/MM/YYYY') : ''
      },
      computedDateFormattedMomentjs4 () {
        return this.ngaysinh_me ? moment(this.ngaysinh_me).format('DD/MM/YYYY') : ''
      },
      computedDateFormattedMomentjs5 () {
        return this.ngaysinh_vc ? moment(this.ngaysinh_vc).format('DD/MM/YYYY') : ''
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
          dcchitiet: this.dcchitiet,
          dctamtru: this.dctamtru,
          quanhuyen_tt: this.quanhuyen_tt,
          dcchitiet_tt: this.dcchitiet_tt,
          nghenghiep: this.nghenghiep,
          tendccoquan: this.tendccoquan,
          hoten_cha: this.hoten_cha,
          hoten_me: this.hoten_me,
          hoten_vc: this.hoten_vc
        })
      },
      validate () {
        this.$refs.form.validate()
      }
    },
    components: {
      Header: () => import('@/components/Header'),
    },
  }
</script>