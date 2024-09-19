<template>
    <div class="content">
      <div class="image-container">
        <img src="@/components/images/progreso.jpg" alt="Imagen Principal" class="main-image" />
      </div>
  
      <div class="text-container">
        <h1 class="text">Sistema en progreso - Espere al siguiente Sprint</h1>
      </div>
  
      <div class="button-container">
        <button class="btn-back" @click="goBack">Volver</button>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'EnProgreso',
    methods: {
      goBack() {
        this.$router.go(-1); 
      }
    }
  }
  </script>
  
  <style scoped>
  .content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh; 
    background-color: #f0f4f8; 
    padding: 20px; 
  }
  
  .image-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 80px;
    margin-bottom: 20px;
  }
  
  .main-image {
    max-width: 50%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
  }
  
  .text-container {
    margin-bottom: 20px; 
    text-align: center;
  }
  
  .text {
    font-size: 24px; 
    font-weight: bold;
    color: #2c3e50; 
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); 
    background: linear-gradient(45deg, #6c5b7b, #c06c84); 
    -webkit-background-clip: text;
    color: transparent; 
  }
  
  .button-container {
    margin-top: 20px;
  }
  
  .btn-back {
    background-color: #6c5b7b;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease; /* Transición suave */
    margin-bottom: 40px;
  }
  
  .btn-back:hover {
    background-color: #c06c84;
    transform: scale(1.05); /* Escala ligera en hover */
  }
  </style>
  