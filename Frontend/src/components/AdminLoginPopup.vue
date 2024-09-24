<template>
  <div class="popup-overlay" @click.self="$emit('close')">
    <div class="popup-content">
      <button class="close-btn" @click="$emit('close')">&times;</button>
      <h2>Iniciar sesión como Admin / Director</h2>
      <form @submit.prevent="handleSubmit">
        <div class="form-group">
          <label for="email">Email</label>
          <input type="text" id="email" v-model="loginRequest.correo" required>
        </div>
        <div class="form-group">
          <label for="password">Contraseña</label>
          <input type="password" id="password" v-model="loginRequest.contrasena" required>
        </div>
        <div class="form-group">
          <a href="#" @click.prevent="forgotPassword">Olvidé mi contraseña</a>
        </div>
        <button type="submit" class="submit-btn">Ingresar</button>
      </form>

      <!-- Botón para volver al login de estudiante -->
      <button class="role-btn" @click="$emit('switch-to-student-login')">Estudiante</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';  // Importar SweetAlert

export default {
  name: 'AdminLoginPopup',
  data() {
    return {
      loginRequest: {
        correo: '', // Correo para la autenticación
        contrasena: '' // Contraseña para la autenticación
      },
      message: '' // Variable para almacenar mensajes de error
    };
  },
  methods: {
    async login() {
      try {
        const response = await axios.post('http://localhost:8082/usuario/login', this.loginRequest);
        const userData = response.data.result;

        // Guardar los datos de la respuesta en el localStorage
        localStorage.setItem('correo', userData.correo);
        localStorage.setItem('usuario', userData.usuario);
        localStorage.setItem('nombre', userData.nombre);
        localStorage.setItem('rol', userData.rol);

        // Mostrar un mensaje de éxito con SweetAlert
        Swal.fire({
          icon: 'success',
          title: 'Inicio de sesión correcto',
          text: `Bienvenido ${userData.nombre}`,
          confirmButtonText: 'Continuar'
        }).then(() => {
          // Redirigir según el rol obtenido
          if (userData.rol === 'Administrador') {
            this.$router.push({ name: 'menuAdministrador' });
          } else if (userData.rol === 'Director') {
            this.$router.push({ name: 'menuDirector' });
          } else {
            this.message = 'Rol no reconocido';
            Swal.fire({
              icon: 'error',
              title: 'Error',
              text: this.message,
              confirmButtonText: 'Aceptar'
            });
          }
        });
      } catch (error) {
        if (error.response && error.response.data && error.response.data.error) {
          this.message = error.response.data.error; // Mensaje de error del backend
        } else {
          this.message = 'Error al iniciar sesión. Por favor, inténtalo de nuevo.';
        }
        // Mostrar mensaje de error con SweetAlert
        Swal.fire({
          icon: 'error',
          title: 'Error de inicio de sesión',
          text: this.message,
          confirmButtonText: 'Aceptar'
        });
      }
    },
    handleSubmit() {
      // Validar que ambos campos estén llenos
      if (!this.loginRequest.correo || !this.loginRequest.contrasena) {
        Swal.fire({
          icon: 'error',
          title: 'Campos incompletos',
          text: 'Por favor, complete ambos campos.',
          confirmButtonText: 'Aceptar',
        });
        return; // No continuar con la solicitud si hay campos vacíos
      }
      this.login(); // Ejecutar la función de login
    },
    forgotPassword() {
      // Implementar lógica de recuperación de contraseña
      Swal.fire({
        icon: 'info',
        title: 'Recuperar contraseña',
        text: 'Para recuperar tu contraseña, contacta a soporte.',
        confirmButtonText: 'Aceptar',
      });
    },
  }
};
</script>

<style scoped>
.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.popup-content h2 {
  text-align: center; 
  margin-bottom: 10px; 
}

.popup-content {
  background-color: white;
  border: 5px solid #63C7B2; 
  padding: 20px;
  border-radius: 15px;
  position: relative;
  width: 350px;
  z-index: 1001;
}

.close-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background: none;
  border: none;
  font-size: 20px;
  cursor: pointer;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
}

.form-group input {
  width: 100%;
  padding: 8px;
  border: 1px solid #929292;
  border-radius: 15px;
}

.submit-btn {
  width: 100%;
  padding: 10px;
  background-color: #8E6C88; /* Color diferente para distinguir */
  color: white;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 17px;
}

.submit-btn:hover {
  background-color: #63C7B2;
  color: white;
}

.role-btn {
  width: 100%;
  padding: 10px;
  background-color: #8E6C88;
  color: white;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 17px;
}

.role-btn:hover {
  background-color: #63C7B2;
  color: white;
}
</style>
