import PassportServices from '@/services/PassportServices'

export const AdminMixin = {
  data () {
    return {
      passports: {},
      snackbar: false,
      snackbar_props: {},
      page: 1,
      totalPage: null,
    }
  },
  watch: {
    async page(page) {
      this.getPassport(page)
    }
  },
  created: function () {
    console.log('hello')
  },
  filters: {
    changeStatus: (status) => {
      if (status == 'xt waiting') return 'Chờ xác thực'
      else if (status == 'xd waiting') return 'Chờ xét duyệt'
      else if (status == 'xd canceled') return 'Không xét duyệt'
      else if (status == 'xt completed') return 'Đã xác thực'
      else if (status == 'xt canceled') return 'Không hợp lệ'
      else if (status == 'lt approved') return 'Đã xét duyệt'
      else if (status == 'lt canceled') return 'Không xét duyệt'
      else if (status == 'gs archived') return 'Đã lưu trữ'
      else return ''
    }
  },
  methods: {
    async getPassport(page) {
      const {data, total} = (await PassportServices.get({page: page, status: this.status})).data
      this.passports = data
      this.totalPage = total
    }
  },
  async mounted () {   
    this.getPassport(this.page)
  }
}