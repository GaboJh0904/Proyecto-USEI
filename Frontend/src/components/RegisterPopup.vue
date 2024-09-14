<template>
    <div class="popup-overlay" @click.self="$emit('close')">
      <div class="popup-content">
        <button class="close-btn" @click="$emit('close')">&times;</button>
        <h2>Registrarse</h2>
        <form @submit.prevent="handleSubmit">
          <div class="form-group">
            <label for="name">Nombre</label>
            <input type="text" id="name" v-model="name" required>
          </div>
          <div class="form-group">
            <label for="institutional-email">Correo institucional</label>
            <input type="email" id="institutional-email" v-model="institutionalEmail" required>
          </div>
          <div class="form-group">
            <label for="personal-email">Correo personal</label>
            <input type="email" id="personal-email" v-model="personalEmail" required>
          </div>
          <div class="form-group">
            <label for="phone">Teléfono</label>
            <input type="tel" id="phone" v-model="phone" required>
          </div>
          <div class="form-group">
            <label for="password">Contraseña</label>
            <input type="password" id="password" v-model="password" required>
          </div>
          <button type="submit" class="submit-btn">Ingresar</button>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'RegisterPopup',
    data() {
      return {
        name: '',
        institutionalEmail: '',
        personalEmail: '',
        phone: '',
        password: ''
      }
    },
    methods: {
      handleSubmit() {
        // Implementar lógica de registro
        console.log('Registrar', this.name, this.institutionalEmail, this.personalEmail, this.phone, this.password)
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

  .popup-content {
    background-color: white;
    padding: 20px;
    border: 5px solid #8E6C88;
    border-radius: 15px;
    position: relative;
    width: 300px;
  }

  .popup-content h2 {
  text-align: center; 
  margin-bottom: 10px; 
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
    font-size: 17px;
    background-color: #8E6C88;
    color: white;
    border: none;
    border-radius: 15px;
    cursor: pointer;
    margin-top: 10px;
  }

  </style>