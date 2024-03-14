<template>
  <b-navbar fixed="top" toggleable type="dark" variant="dark">
    <b-navbar-brand href="./Home.vue">
      <img src="../assets/logo.svg" width="50" height="50" class="logo d-inline-block align-top" alt="">
    </b-navbar-brand>
    <h1>SNCF</h1>
    <b-navbar-toggle target="navbar-toggle-collapse">
      <template class="dropdown-menu" #default="{ expanded }">
        <b-icon v-if="expanded" icon="chevron-bar-up"></b-icon>
        <b-icon v-else icon="chevron-bar-down"></b-icon>
      </template>
    </b-navbar-toggle>

    <b-collapse id="navbar-toggle-collapse" is-nav>
      <b-navbar-nav class="ml-auto">
        <b-nav-item href="#">Trains</b-nav-item>
        <b-nav-item href="#">Destinations</b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

<style scoped>
.logo {
  margin-left: 50px;
  border-radius: 10px;
}

h1 {
  color: #C75C5C;
  font-size: 2.5rem;
}

.navbar-toggler {
  margin-right: 50px;
}

.nav-link {
  color: #C75C5C;
  font-size: 1rem;
}
</style>
