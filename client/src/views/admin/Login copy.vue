<template>
  <v-container>
      <v-row justify="center">
          <v-col cols="12" md="6">
            <v-form
              ref="form"
              v-model="valid"
              lazy-validation
            >
              <v-text-field
                v-model="email"
                :counter="10"
                :rules="nameRules"
                label="Email"
                required
                autocomplete="email"
              ></v-text-field>

              <v-text-field
                v-model="password"
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                :rules="[rules.required, rules.min]"
                :type="show1 ? 'text' : 'password'"
                name="input-10-1"
                label="Mật khẩu"
                hint="Ít nhất 6 ký tự"
                counter
                @click:append="show1 = !show1"
              ></v-text-field>

              <v-btn
                :disabled="!valid"
                color="success"
                class="mr-4"
                @click="login"
              >
                LOGIN
              </v-btn>
            </v-form>
          </v-col>
      </v-row>
  </v-container>
</template>

<script>
import AuthenticationService from '../../services/AuthencationServices'

export default {
  data: () => ({
    valid: true,
    show1: false,
    email: '',
    password: '',
    error: null,
    rules: {
      required: value => !!value || 'Required.',
      min: v => v.length >= 6 || 'Min 6 characters'
    },
    name: '',
    nameRules: [
      v => !!v || 'Vui lòng nhập email',
    ],
  }),
  methods: {
    validate () {
      this.$refs.form.validate()
    },
    async login () {
      try {
        const response = await AuthenticationService.login({
          email: this.email,
          password: this.password
        })
        this.$store.dispatch('setToken', response.data.token)
        this.$store.dispatch('setUser', response.data.user)
        localStorage.setItem('isUserLoggedIn', true)
        localStorage.setItem('user', response.data.user['email'])
        localStorage.setItem('role', response.data.user['role'])
        window.location.href = '/admin/dashboard/index'
      } catch (error) {
        this.error = error.response.data.error
      }
    }
  }
}
</script>

<style>

</style>