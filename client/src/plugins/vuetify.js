import Vue from 'vue';
import Vuetify from 'vuetify/lib';
import VTooltip from 'v-tooltip'

Vue.use(VTooltip)
Vue.use(Vuetify);

export default new Vuetify({
  icons: {
    iconfont: 'mdi',
  },
});
