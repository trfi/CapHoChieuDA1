<template>
  <div class="text-center ma-2">
    <v-snackbar
      v-model="snackbar"
      top
      :color="snackbar_props.color"
    >
      {{ snackbar_props.text }}
      <v-btn
        color="black"
        text
        @click="snackbar = false"
      >
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-snackbar>
  </div>
</template>

<script>
  export default {
    props: {
      snackbar: Boolean,
      snackbar_props: Object,
    },
  }
</script>