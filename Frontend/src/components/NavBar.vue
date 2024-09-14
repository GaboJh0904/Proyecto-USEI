<template>
  <nav>
    <div class="logo">
      <img src="@/components/images/USEI.png" alt="Logo" />
    </div>
    <div class="nav-links">
      <a href="#">Opción 1</a>
      <a href="#">Opción 2</a>
      <a href="#">Opción 3</a>
      <a href="#">Opción 4</a>
      <a href="#" class="login-btn">Iniciar Sesión</a>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'NavBar',
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

nav {
  position: fixed;
  top: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 50px;
  z-index: 999;
  background: #63c7b2;
  height: 70px;
  box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.1);
}

.logo img {
  height: 50px; 
}

.nav-links {
  display: flex;
  align-items: center;
  position: relative;
}

.nav-links a {
  font-size: 15px;
  text-transform: uppercase;
  color: white;
  text-decoration: none;
  padding: 0 20px;
  line-height: 30px;
  position: relative;
}

.nav-links a:hover {
  color: #263d42;
}

.login-btn {
  background: #8e6c88;
  padding: 5px 15px; 
  border-radius: 20px; 
  color: white;
  text-transform: uppercase;
  font-size: 14px;
  transition: background 0.3s ease;
  line-height: normal; 
}

.login-btn:hover {
  background: #80ced7;
}
</style>
