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
        <div class="form-group">
          <label for="nombre">Nombre</label>
          <input type="text" id="nombre" v-model="nombre" required>
        </div>
        <div class="form-group">
          <label for="personal-email">Correo personal</label>
          <input type="email" id="personal-email" v-model="correoPersonal" required>
        </div>
        <div class="form-group">
          <label for="institutional-email">Correo institucional</label>
          <input type="email" id="institutional-email" v-model="correoInstitucional" required>
        </div>
        <div class="form-group">
          <a href="#" @click.prevent="forgotPassword">Olvidé mi contraseña</a>
        </div>
        <button type="submit" class="submit-btn">Ingresar</button>
      </form>

      <!-- Nuevo botón para Admin/Director -->
      <button class="role-btn" @click="selectRole">Admin / Director</button>

      <button class="register-btn" @click="$emit('switch-to-register')">Registrarse</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2'; // Importar SweetAlert

export default {
  name: 'LoginPopup',
  data() {
    return {
      ci: '',       
      password: '',  
      nombre: '',  // Nombre del estudiante
      correoPersonal: '',  // Correo personal
      correoInstitucional: '',  // Correo institucional
      role: 'estudiante'  
    };
  },
  setup() {
    const router = useRouter();
    return { router };
  },
  methods: {
    validateEmail(email) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
    },
    validateName(name) {
      const nameRegex = /^[a-zA-Z\s]+$/;
      return nameRegex.test(name);
    },
    async handleSubmit() {
      // Validar si los campos tienen formato correcto
      if (!this.validateName(this.nombre)) {
        Swal.fire({
          icon: 'error',
          title: 'Nombre inválido',
          text: 'El nombre solo puede contener letras y espacios.',
          confirmButtonText: 'Aceptar'
        });
        return;
      }

      if (!this.validateEmail(this.correoPersonal)) {
        Swal.fire({
          icon: 'error',
          title: 'Correo personal inválido',
          text: 'El correo personal debe tener un formato válido.',
          confirmButtonText: 'Aceptar'
        });
        return;
      }

      if (!this.validateEmail(this.correoInstitucional)) {
        Swal.fire({
          icon: 'error',
          title: 'Correo institucional inválido',
          text: 'El correo institucional debe tener un formato válido.',
          confirmButtonText: 'Aceptar'
        });
        return;
      }

      try {
        const response = await axios.post('http://localhost:8082/estudiante/login', {
          ci: this.ci,
          contrasena: this.password,
          role: this.role
        });

        if (response.data.code === 200) {
          localStorage.setItem('ci', this.ci);
          localStorage.setItem('rol', response.data.rol);
          localStorage.setItem('username', response.data.nombre);

          if (this.role === 'admin') {
            this.$router.push({ name: 'menuAdministrador' });
          } else if (this.role === 'director') {
            this.$router.push({ name: 'menuDirector' });
          } else {
            this.$router.push({ name: 'menuEstudiante' });
          }
        }
      } catch (error) {
        Swal.fire({
          icon: 'error',
          title: 'Error en el inicio de sesión',
          text: error.response ? error.response.data.message : 'Error desconocido. Intente nuevamente.',
          confirmButtonText: 'Aceptar'
        });
      }
    },
    forgotPassword() {
      Swal.fire({
        icon: 'info',
        title: 'Recuperar contraseña',
        text: 'Implementar lógica de recuperación de contraseña.',
        confirmButtonText: 'Aceptar'
      });
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

.role-btn {
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

.role-btn:hover {
  background-color: #8E6C88;
  color: white;
}
</style>
