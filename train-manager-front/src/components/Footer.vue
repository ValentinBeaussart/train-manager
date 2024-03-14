<template lang="">

  <div>
    <div class="footer">
  <div class="footer-links">
    <!-- <a href="#"><i class="fab fa-github"></i></a>
    <a href="#"><i class="fab fa-instagram"></i></a>
    <a href="#"><i class="fab fa-facebook"></i></a>
    <a href="#"><i class="fab fa-twitter"></i></a>
    <a href="#"><i class="fab fa-linkedin"></i></a> -->
  </div>
  <div class="footer-copyright">
    This footer is made at Lyon
  </div>
</div>
  </div>
</template>

<style scoped>
.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background: #332D2D;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100px;
  padding: 0px 50px;
}

.footer-copyright {
  display: flex;
  align-items: center;
  color: #C75C5C;
  font-size: 24px;
}

.footer-links {
  display: flex;
  align-items: center;
}

.footer-links a {
  color: #C75C5C;
  opacity: 0.15;
  text-decoration: none;
  font-size: 24px;
  padding: 0px 10px;
}

.footer-links a:hover {
  opacity: 1;
}

.footer .fa-heart {
  color: #D23333;
}
</style>
