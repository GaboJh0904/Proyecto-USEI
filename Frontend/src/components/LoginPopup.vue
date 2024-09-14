<template>
    <div class="popup-overlay" @click.self="$emit('close')">
      <div class="popup-content">
        <button class="close-btn" @click="$emit('close')">&times;</button>
        <h2>Iniciar sesión</h2>
        <form @submit.prevent="handleSubmit">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" v-model="email" required>
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
  export default {
    name: 'LoginPopup',
    data() {
      return {
        email: '',
        password: ''
      }
    },
    methods: {
      handleSubmit() {
        // Implementar lógica de inicio de sesión
        console.log('Iniciar sesión', this.email, this.password)
      },
      forgotPassword() {
        // Implementar lógica de recuperación de contraseña
        console.log('Olvidé mi contraseña')
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
    width: 300px;
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
  
  .submit-btn, .register-btn {
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
  
  .register-btn {
    background-color: #CCDBDC;
    color: #333;
  }
  </style>