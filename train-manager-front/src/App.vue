<template>
  <div id="app">
    <Navabar />
    <router-view />
  </div>
</template>

<script>
import Navabar from './components/Navbar.vue'

export default {
  name: 'App',
  components: {
    Navabar
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
