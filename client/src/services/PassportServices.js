import api from "@/services/api";

export default {
  apply(information) {
    console.log(information)
    return api().post("passport/apply", information)
  },
  get(information) {
    return api().post('passport', information)
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
