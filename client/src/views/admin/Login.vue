<template>
  <v-app id="inspire">
    <v-content>
      <v-container
        class="fill-height"
        fluid
      >
        <v-row
          align="center"
          justify="center"
        >
          <v-col
            cols="12"
            sm="8"
            md="4"
          >
            <v-card class="elevation-12">
              <v-toolbar
                color="teal"
                dark
              >
                <v-icon left>mdi-vuetify</v-icon>
                <v-toolbar-title>Login Admin Dashboard</v-toolbar-title>
                <v-spacer />
                <v-tooltip bottom>
                  <template>
                    <v-btn
                      icon
                      large
                      target="_blank"
                    >
                      <v-icon>mdi-code-tags</v-icon>
                    </v-btn>
                  </template>
                  <span>Source</span>
                </v-tooltip>
                <v-tooltip right>
                  <template>
                    <v-btn
                      icon
                      large
                      href="https://codepen.io/johnjleider/pen/pMvGQO"
                      target="_blank"
                    >
                      <v-icon>mdi-codepen</v-icon>
                    </v-btn>
                  </template>
                  <span>Codepen</span>
                </v-tooltip>
              </v-toolbar>
              <v-card-text>
                <v-form>
                  <v-text-field
                    color="green"
                    label="Email"
                    name="login"
                    prepend-icon="mdi-account"
                    type="text"
                    v-model="email"
                  />

                  <v-text-field
                    color="green"
                    id="password"
                    label="Password"
                    name="password"
                    prepend-icon="mdi-lock"
                    type="password"
                    v-model="password"
                  />
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer />
                <v-btn width="100px" color="teal" dark @click="login">Login</v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-content>
  </v-app>
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
        localStorage.setItem('role_id', response.data.user['role_id'])
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