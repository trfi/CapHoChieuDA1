<template>
  <div class="text-center mt-10">
    <v-pagination
      v-model="page"
      :length="totalPage"
      :total-visible="7"
      @input="pageChange"
    ></v-pagination>
  </div>
</template>

<script>
  export default {
    props: {
      page: Number,
      totalPage: Number
    },
    methods: {
      pageChange() {
        this.$emit('update:page', this.page)
      }
    }
  }
</script>