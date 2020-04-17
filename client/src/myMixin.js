export const myMixin = {
  data () {
      return {}
  },
  created: function () {
    console.log('hello')
  },
  filters: {
    changeStatus: (status) => {
      if (status == 'xt waiting') return 'Chờ xác thực'
      else if (status == 'xd waiting') return 'Chờ xét duyệt'
      else if (status == 'xt completed') return 'Đã xác thực'
      else if (status == 'xt canceled') return 'Không hợp lệ'
      else if (status == 'lt approved') return 'Đã xét duyệt'
      else if (status == 'lt canceled') return 'Không xét duyệt'
      else if (status == 'gs archived') return 'Đã lưu trữ'
      else return ''
    }
  }
}