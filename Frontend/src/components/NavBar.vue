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

      <!-- Mostrar iconos de usuario y notificaciones si es vista del estudiante -->
      <template v-if="isStudent">
        <!-- Icono de notificaciones -->
        <button @click="openNotifications" class="icon-button notification-icon">
          <i class="fas fa-bell"></i>
        </button>

        <!-- Icono de usuario y label con el nombre -->
        <div class="user-wrapper">
          <button @click="openUserProfile" class="icon-button user-icon">
            <i class="fas fa-user-circle"></i>
          </button>
          <span class="username-label">{{ username }}</span>
        </div>
      </template>

      <!-- Mostrar el botón de iniciar sesión si NO es la vista del estudiante -->
      <a v-else href="#" class="login-btn" @click="showLoginPopup = true">Iniciar Sesión</a>
    </div>

    <!-- Mostrar el popup de perfil de usuario -->
    <UserProfilePopup v-if="showUserProfile" @close="closeUserProfile" />
  </nav>
</template>

<script>
import LoginPopup from '@/components/LoginPopup.vue';
import RegisterPopup from '@/components/RegisterPopup.vue';
import UserProfilePopup from '@/components/UserProfilePopup.vue';

export default {
  name: 'NavBar',
  components: {
    LoginPopup,
    RegisterPopup,
    UserProfilePopup
  },
  props: {
    isStudent: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      showLoginPopup: false,
      showRegisterPopup: false,
      showUserProfile: false, // Controla la visibilidad del popup del perfil de usuario
      username: 'USERNAME' // Aquí puedes actualizar dinámicamente el nombre del usuario
    };
  },
  methods: {
    switchToRegister() {
      this.showLoginPopup = false;
      this.showRegisterPopup = true;
    },
    openNotifications() {
      alert('Abriendo notificaciones...');
    },
    openUserProfile() {
      // Asegurarnos de que este método se esté ejecutando correctamente
      console.log("Abriendo perfil de usuario...");
      this.showUserProfile = true; // Esto debe controlar la visibilidad del popup
    },
    closeUserProfile() {
      this.showUserProfile = false; // Cerrar el popup cuando se haga clic en cerrar
    }
  }
};
</script>

<style scoped>
/* Estilos para el NavBar y botones */
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
}

.nav-links a {
  font-size: 15px;
  text-transform: uppercase;
  color: white;
  text-decoration: none;
  padding: 0 20px;
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
}

.login-btn:hover {
  background: #80ced7;
}

.icon-button {
  background: none;
  border: none;
  cursor: pointer;
  margin-right: 10px;
  color: white;
  font-size: 28px; 
}

.icon-button:hover {
  color: #263d42; 
}

.user-wrapper {
  display: flex;
  align-items: center;
}

.username-label {
  font-size: 16px;
  color: white;
  margin-left: 5px;
}
</style>
