<template>
  <v-dialog v-model="dialog" max-width="650">
    <template v-slot:activator="{ on }">
      <v-btn 
        icon x-small fab color="primary" v-on="on"
        v-tooltip="{ content: 'Chi tiết' }"
      >
        <v-icon>mdi-information-outline</v-icon>
      </v-btn>
    </template>
    <v-card class="mx-auto pa-5">
      <v-row v-for="(value, key) in passport" v-bind:key="key">
        <v-col>
          <div class="caption grey--text">{{key}}</div>
          <v-card-text>{{ value }}</v-card-text>
        </v-col>
      </v-row>
      <v-divider></v-divider>
    </v-card>
  </v-dialog>
</template>

<script>
  export default {
    props: {
      passport: {},
      dialog: Boolean
    },
  }
</script>