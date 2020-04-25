<template>
  <div class="home">
    <Header />
    <v-container class="grey lighten-3 my-10">
      <v-row no-gutters>
      <template v-for="(item, i) in items">
        <v-col :key="i">
          <v-card
            class="pa-2 mx-auto img-card"
            max-width="450"
            height="220"
            tile
          >
            <v-img 
              width="100%"
              height="80%"
              src="../assets/passport_link.svg">
            </v-img>
            <v-card-actions>
              <v-btn text @click="dialog = true" v-if="i===3">
                {{item.title}}
              </v-btn>
              <v-btn text :to="item.route" v-else>
                {{item.title}}
              </v-btn>
            </v-card-actions>
            
          </v-card>
        </v-col>
        <v-responsive
          v-if="i === 1"
          :key="`width-${i}`"
          width="100%"
        ></v-responsive>
      </template>
      </v-row>
    </v-container>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card>
        <v-form @submit.prevent="lookup">
        <v-card-title>
          <span class="headline">Tra cứu tình trạng Hộ chiếu</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field v-model.number="lookupInfo" 
                  label="Nhập số CMND hoặc mã Hộ chiếu*" required>
                </v-text-field>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn type="submit" color="blue darken-1" text>
            Tra cứu
          </v-btn>
        </v-card-actions>
        </v-form>
      </v-card>
    </v-dialog>
    <v-dialog v-model="dialogInfo" max-width="600px">
      <v-card>
        <v-card-title class="mb-5">
          <span class="headline">Thông tình trạng Hộ chiếu</span>
        </v-card-title>
        <v-card-text>
          Mã số hộ chiếu: {{statusInfo.id}}
        </v-card-text>
        <v-card-text>
          Họ tên: {{statusInfo.hoten}}
        </v-card-text>
        <v-card-text>
          Số CMND: {{statusInfo.cmnd}}
        </v-card-text>
        <v-card-text>
          Tình trạng: {{statusInfo.trangthai | changeStatus}}
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="dialogInfo=false">
            Đóng
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import PassportServices from '@/services/PassportServices'
import {myMixin} from '../myMixin.js'

export default {
  mixins: [myMixin],
  components: {
    Header: () => import('@/components/Header'),
  },
  data () {
    return {
      dialog: false,
      dialogInfo: false,
      lookupInfo: null,
      statusInfo: {},
      items: [
        { icon: 'mdi-view-dashboard', title: 'Khai thông tin tờ khai đề nghị cấp hộ chiếu', route: '/passport/declaration' },
        { icon: 'mdi-account-search', title: 'Hướng dẫn thủ tục' },
        { icon: 'mdi-account-check', title: 'Sửa đổi, bổ sung thông tin đã khai' },
        { icon: 'mdi-content-save-all', title: 'Tra cứu tình trạng kết quả hộ chiếu', }
      ],
    }
  },
  methods: {
    async lookup () {
      try {
        const response = await PassportServices.lookup({lookupInfo: this.lookupInfo})
        console.log(response.data)
        this.statusInfo = response.data    
        this.dialog = false
        this.dialogInfo = true
      }
      catch(error) {
        this.error = error.response.data.error
      }
    }
  }
}
</script>