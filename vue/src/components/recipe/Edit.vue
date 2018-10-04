<template>
  <div class="column is-6 is-offset-3">
    <div class="box">
      <Form :recipe="recipe" title="Editing a recipe" @formSubmit="editRecipe"></Form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Form from './Form'

export default {
  name: "edit",

  components: {
    Form
  },

  methods: {
    editRecipe(recipe) {
      axios({
        method: 'patch',
        url: 'http://localhost:3000/api/v1/recipes/' + this.$route.params.id,
        headers: { Authorization: this.$store.getters.getToken },
        data: {
          ...recipe
        }
      })
      .then(() => this.$router.push('/recipes/' + this.$route.params.id))
      .catch(error => this.$store.commit('setErrors', error.response.data.errors));
    }
  },

  data() {
    return {
      recipe: {}
    }
  },

  created() {
    axios
      .get('http://localhost:3000/api/v1/recipes/' + this.$route.params.id, {
        headers: { Authorization: this.$store.getters.getToken }
      })
      .then(response => this.recipe = response.data)
      .catch(error => this.$store.commit('setErrors', error.response.data.errors));
  }
};
</script>

<style scoped>
</style>