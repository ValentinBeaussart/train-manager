<template>
  <b-navbar class="nav" fixed="top" toggleable type="dark" variant="dark">
    <b-navbar-brand href="./Home.vue">
      <img src="../assets/logo.svg" width="50" height="50" class="logo d-inline-block align-top" alt="">
    </b-navbar-brand>
    <div class="nav-title">
      <h1>SNCF</h1>
    </div>
  </b-navbar>
</template>

<style scoped>
.nav {
  display: flex;
  align-items: center;
  justify-content: center;
}

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
