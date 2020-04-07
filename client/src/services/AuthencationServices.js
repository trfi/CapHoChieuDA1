import api from "@/services/api";

export default {
  apply(information) {
    console.log(information)
    return api().post("passport", information);
  },
  login(information) {
    console.log(information)
    return api().post("login", information);
  },
};
