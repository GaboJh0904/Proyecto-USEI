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
        <button @click="toggleNotifications" class="icon-button notification-icon">
          <i class="fas fa-bell"></i>
        </button>

        <!-- Menu de notificaciones -->
        <div v-if="showNotifications" class="notification-menu">
          <h3>Notificaciones</h3>
          <div class="notification-item" v-for="(notification, index) in notifications" :key="index">
            <i class="fas fa-envelope notification-icon"></i> <!-- Icono de mensaje -->
            <div class="notification-content">
              <p><strong>{{ notification.title }}</strong></p>
              <p>{{ notification.description }}</p>
              <p>{{ notification.time }}</p>
            </div>
          </div>
        </div>

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

    <!-- Mostrar el popup de inicio de sesión -->
    <LoginPopup
      v-if="showLoginPopup"
      @close="showLoginPopup = false"
      @switch-to-register="switchToRegister"
    />

    <!-- Mostrar el popup de registro -->
    <RegisterPopup
      v-if="showRegisterPopup"
      @close="showRegisterPopup = false"
    />
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
    UserProfilePopup,
  },
  props: {
    isStudent: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      showLoginPopup: false,
      showRegisterPopup: false,
      showUserProfile: false,
      showNotifications: false, // Controla la visibilidad del menú de notificaciones
      username: 'USERNAME',
      notifications: [
        { title: 'Nueva notificación', description: 'Revision de encuesta', time: 'Hace 6 horas' }
      ]
    };
  },
  methods: {
    switchToRegister() {
      this.showLoginPopup = false;
      this.showRegisterPopup = true;
    },
    toggleNotifications() {
      this.showNotifications = !this.showNotifications; // Alternar la visibilidad del menú de notificaciones
    },
    openUserProfile() {
      this.showUserProfile = true;
    },
    closeUserProfile() {
      this.showUserProfile = false;
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
  padding: 10px 25px;
  border-radius: 40px; 
  color: white;
  text-transform: uppercase;
  font-size: 14px; 
  transition: background 0.3s ease;
  height: 30px; 
  display: flex;
  align-items: center; 
  justify-content: center; 
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

/* Estilos para el menú de notificaciones */
.notification-menu {
  position: absolute;
  top: 70px;
  right: 50px;
  width: 300px;
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 10px;
  z-index: 1000;
}

.notification-menu h3 {
  font-size: 16px;
  margin-bottom: 10px;
  color: #263d42;
}

.notification-item {
  display: flex;
  align-items: flex-start;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.notification-icon {
  font-size: 25px;
  color: #8e6c88;
  margin-right: 10px;
}

.notification-content p {
  margin: 0;
  color: #333;
}

.notification-item:last-child {
  border-bottom: none;
}
</style>
