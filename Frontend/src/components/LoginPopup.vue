<template>
  <div class="popup-overlay" @click.self="$emit('close')">
    <div class="popup-content">
      <button class="close-btn" @click="$emit('close')">&times;</button>
      <h2>Iniciar sesión</h2>
      <form @submit.prevent="handleSubmit">
        <div class="form-group">
          <label for="ci">CI</label>
          <input type="text" id="ci" v-model="ci" required>
        </div>
        <div class="form-group">
          <label for="password">Contraseña</label>
          <input type="password" id="password" v-model="password" required>
        </div>

        <!-- Mostrar mensaje de error si falta algún campo -->
        <div v-if="errorMessage" class="error-message">{{ errorMessage }}</div>

        <div class="form-group">
          <a href="#" @click.prevent="$emit('switch-to-code-verification')">Olvidé mi contraseña</a>
        </div>
        <button type="submit" class="submit-btn">Ingresar</button>
      </form>

      <!-- Botón para Admin/Director -->
      <button class="role-btn" @click="$emit('switch-to-admin-login')">Admin / Director</button>

      <button class="register-btn" @click="$emit('switch-to-register')">Registrarse</button>
    </div>
  </div>
</template>
  
<script>
import axios from 'axios';
import { useRouter } from 'vue-router';
import Swal from 'sweetalert2';  

export default {
  name: 'LoginPopup',
  data() {
    return {
      ci: '',       // CI para el inicio de sesión
      password: '',  // Contraseña
      role: 'estudiante',  // Rol predeterminado
      errorMessage: ''  // Nueva variable para el mensaje de error
    };
  },
  setup() {
    const router = useRouter(); // Para utilizar el enrutador de Vue
    return { router };
  },
  methods: {
    async handleSubmit() {
      // Validar que ambos campos estén llenos
      if (!this.ci || !this.password) {
        this.errorMessage = ''; // Reiniciar el mensaje de error
        // Usar SweetAlert para mostrar el mensaje
        Swal.fire({
          icon: 'error',
          title: 'Campos incompletos',
          text: 'Por favor, complete ambos campos.',
          confirmButtonText: 'Aceptar',
        });
        return; // No continuar con la solicitud
      }

      try {
        const response = await axios.post('http://localhost:8082/estudiante/login', {
          ci: this.ci,
          contrasena: this.password,
          role: this.role  // Enviar también el rol seleccionado
        });
        console.log('Respuesta del servidor:', response.data);

        // Manejar respuesta exitosa
        if (response.data.status === "200 OK") {
          console.log('Inicio de sesión correcto');
          console.log('ID del estudiante:', response.data.result.id_estudiante); // Mostrar el ID del estudiante
          const estudianteId = response.data.result.id_estudiante;

          if (estudianteId) {
        console.log('ID del estudiante:', estudianteId); // Mostrar el ID del estudiante
        localStorage.setItem('id_estudiante', estudianteId); // Guardar el id del estudiante en localStorage
      } else {
        console.error('ID del estudiante no está presente en la respuesta.');
        return; // Si no hay ID de estudiante, no continuar
      }

      // Guardar otros datos en localStorage
      localStorage.setItem('ci', response.data.result.ci);
      localStorage.setItem('correoInsitucional', response.data.result.correoInsitucional);
      localStorage.setItem('nombre', response.data.result.nombre);
      localStorage.setItem('apellido', response.data.result.apellido);
      localStorage.setItem('rol', response.data.result.rol);
      localStorage.setItem('telefono', response.data.result.telefono);


          // Usar SweetAlert para mostrar éxito
          Swal.fire({
            icon: 'success',
            title: 'Inicio de sesión correcto',
            text: `Bienvenido/a, ${response.data.result.nombre}`,
            confirmButtonText: 'Continuar',
          }).then(() => {
            // Redirigir al usuario dependiendo del rol después de confirmar
            if (response.data.result.rol === 'admin') {
              this.$router.push({ name: 'menuAdministrador' });
            } else if (response.data.result.rol === 'director') {
              this.$router.push({ name: 'menuDirector' });
            } else {
              this.$router.push({ name: 'menuEstudiante' });
            }
          });
        }
      } catch (error) {
        // Manejar respuesta no exitosa
        if (error.response && error.response.data.status === "401 Unauthorized") {
          // Usar SweetAlert para mostrar error de credenciales incorrectas
          Swal.fire({
            icon: 'error',
            title: 'Credenciales incorrectas',
            text: error.response.data.error, // Mostrar el mensaje de error devuelto por el backend
            confirmButtonText: 'Aceptar',
          });
        } else {
          // Usar SweetAlert para otros errores
          Swal.fire({
            icon: 'error',
            title: 'Error en el inicio de sesión',
            text: 'Ha ocurrido un error inesperado, intente nuevamente más tarde.',
            confirmButtonText: 'Aceptar',
          });
        }
      }
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
    selectRole() {
      // Implementar la lógica para alternar el rol
      if (this.role === 'estudiante') {
        this.role = 'admin';
      } else if (this.role === 'admin') {
        this.role = 'director';
      } else {
        this.role = 'estudiante';
      }
      Swal.fire({
        icon: 'info',
        title: 'Rol seleccionado',
        text: `Rol seleccionado: ${this.role}`,
        confirmButtonText: 'Aceptar',
      });
    },
    goToEnProgreso(){
      this.$router.push('/en-progreso');
    }
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
  background-color: #63C7B2;
  color: white;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 17px;
}

.submit-btn:hover {
  background-color: #8E6C88;
  color: white;
}

.register-btn {
  width: 100%;
  padding: 10px;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  margin-top: 10px;
  background-color: #CCDBDC;
  color: #333;
}

.register-btn:hover {
  background-color: #263D42;
  color: white;
}

.error-message {
  color: red;
  margin-bottom: 10px;
}

/* Nuevo botón estilo */
.role-btn {
  width: 100%;
  padding: 10px;
  background-color: #63C7B2;  /* Mismo color que el botón de "Ingresar" */
  color: white;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 17px;
}

.role-btn:hover {
  background-color: #8E6C88;
  color: white;
}
</style>