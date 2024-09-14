<template>
    <div class="pagina-inicio">
      <header>
        <nav>
          <a href="#">Opción 1</a>
          <a href="#">Opción 2</a>
          <a href="#">Opción 3</a>
          <a href="#">Opción 4</a>
        </nav>
      </header>
      
      <main>
        <div class="slider">
          <button class="prev">&lt;</button>
          <img src="\src\components\images\maquetaUSEI.jpg" alt="Graduates celebrating" />
          <button class="next">&gt;</button>
        </div>
        
        <section class="content">
          <h2>USEI</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sollicitudin enim quis ipsum efficiend imperdiet. Sed efficitur lacus ultricies. Pellentesque quis ultricies odio. Duis ante mauris, hendrerit ut odio at, efficitur commodo nisi.</p>
          
          <h2>USEI</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sollicitudin enim quis ipsum efficiend imperdiet. Sed efficitur lacus ultricies. Pellentesque quis ultricies odio. Duis ante mauris, hendrerit ut odio at, efficitur commodo nisi.</p>
        </section>
      </main>
      <button @click="showLoginPopup = true">Iniciar sesión</button>
    <button @click="showRegisterPopup = true">Registrarse</button>

    <LoginPopup v-if="showLoginPopup" @close="showLoginPopup = false" @switch-to-register="switchToRegister" />
    <RegisterPopup v-if="showRegisterPopup" @close="showRegisterPopup = false" />
  </div>
</template>

<script>
import LoginPopup from '@/components/LoginPopup.vue'
import RegisterPopup from '@/components/RegisterPopup.vue'

export default {
  name: 'PaginaInicio',
  components: {
    LoginPopup,
    RegisterPopup
  },
  data() {
    return {
      showLoginPopup: false,
      showRegisterPopup: false
    }
  },
  methods: {
    switchToRegister() {
      this.showLoginPopup = false
      this.showRegisterPopup = true
    }
  }
}
</script>
  
  <style scoped>
  .pagina-inicio {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    font-family: Arial, sans-serif;
  }
  
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #5cd3b4;
    padding: 1.5rem;
  }
  
  nav a {
    color: white;
    text-decoration: none;
    align-items: center;
    justify-content: left;
    margin-left: 4rem;
  }
  
  main {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
  }
  
  .slider {
    position: relative;
    flex-grow: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  }
  
  .slider img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
  }
  
  .prev, .next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0,0,0,0.5);
    color: white;
    border: none;
    padding: 1rem;
    cursor: pointer;
  }
  
  .prev { left: 10px; }
  .next { right: 10px; }
  
  .content {
    padding: 2rem;
    background-color: #f8f8f8;
  }
  </style>