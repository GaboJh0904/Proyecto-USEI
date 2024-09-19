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
          <a href="#" @click.prevent="forgotPassword">Olvidé mi contraseña</a>
        </div>
        <button type="submit" class="submit-btn">Ingresar</button>
      </form>
      <button class="register-btn" @click="$emit('switch-to-register')">Registrarse</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { useRouter } from 'vue-router';

export default {
  name: 'LoginPopup',
  data() {
    return {
      ci: '',       // CI para el inicio de sesión
      password: ''  // Contraseña
    }
  },
  setup() {
    const router = useRouter(); // Para utilizar el enrutador de Vue
    return { router };
  },
  methods: {
    async handleSubmit() {
      try {
        const response = await axios.post('http://localhost:8082/estudiante/login', {
          ci: this.ci,
          contrasena: this.password
        });

        // Manejar respuesta exitosa
        if (response.data.code === 200) {
          console.log('Inicio de sesión correcto');
          console.log(response.data.rol); // Mostrar el rol del usuario

          // Guardar información en el localStorage si es necesario
          localStorage.setItem('ci', this.ci);
          localStorage.setItem('rol', response.data.rol);
          
          // Redirigir al usuario a menuEstudiante
          this.router.push({ name: 'menuEstudiante' });
        }
      } catch (error) {
        // Manejar error o credenciales incorrectas
        if (error.response && error.response.data.code === 401) {
          console.error('Credenciales incorrectas');
          alert('Credenciales incorrectas');
        } else {
          console.error('Error en el inicio de sesión:', error);
        }
      }
    },
    forgotPassword() {
      console.log('Olvidé mi contraseña');
    }
  }
}
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
  padding-right: 0px;
}

.submit-btn{
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
</style>
