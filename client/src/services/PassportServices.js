import api from "@/services/api";

export default {
  apply(information) {
    console.log(information)
    return api().post("passport", information)
  },
  getAll() {
    return api().get('passport')
  },
  getByStatus(status) {
    return api().get('passport/' + status)
  },
  authenticate(id) {
    return api().post(`passport/authenticate/${id}`)
  },
  approve(id, information) {
    return api().post(`passport/approve/${id}`, information)
  },
  archive(id, information) {
    return api().post(`passport/archive/${id}`, information)
  },
  lookup(information) {
    return api().post(`passport/lookup`, information)
  }
};
