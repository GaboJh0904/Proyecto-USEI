<template>
    <div>
      <!-- Header Section -->
      <header>
        <NavBar userRole="Student" />
      </header>
  
      <!-- Main Section with Form -->
      <main class="survey-container">
        <div class="survey-form-container">
          <h1 class="survey-title">ENCUESTA</h1>
          <form @submit.prevent="submitForm" class="survey-form">
            <div class="form-group">
              <label for="year">Año que ingresó a la U.C.B.</label>
              <select id="year" v-model="form.year">
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
              </select>
            </div>
  
            <div class="form-group">
              <label for="career">Carrera de la que se graduó</label>
              <select id="career" v-model="form.career">
                <option value="Derecho">Derecho</option>
                <option value="Ingeniería">Ingeniería</option>
                <option value="Medicina">Medicina</option>
                <option value="Economía">Economía</option>
              </select>
            </div>
  
            <div class="form-group">
              <label for="lastName">Primer apellido</label>
              <input type="text" id="lastName" v-model="form.lastName">
            </div>
  
            <div class="form-group">
              <label>Indique el nivel de educación más alto alcanzado por su madre</label>
              <div class="radio-group">
                <div class="radio-option">
                  <input id="education-none" type="radio" v-model="form.motherEducation" value="No sabe">
                  <label for="education-none">No sabe</label>
                </div>
                <div class="radio-option">
                  <input id="education-primary" type="radio" v-model="form.motherEducation" value="Primaria">
                  <label for="education-primary">Primaria</label>
                </div>
                <div class="radio-option">
                  <input id="education-secondary" type="radio" v-model="form.motherEducation" value="Secundaria">
                  <label for="education-secondary">Secundaria</label>
                </div>
                <div class="radio-option">
                  <input id="education-university" type="radio" v-model="form.motherEducation" value="Educación universitaria incompleta">
                  <label for="education-university">Educación universitaria incompleta</label>
                </div>
              </div>
            </div>
  
            <div class="form-actions">
              <button class="submit-button" @click="goToResume">Siguiente</button>
            </div>
          </form>
        </div>
      </main>
  
      <!-- Footer Section -->
      <FooterComponent />
    </div>
  </template>
  
 <script>
 import NavBar from '@/components/NavBar.vue';
 import FooterComponent from '@/components/FooterComponent.vue';

 export default {
   name: 'EncuestaEstudiante',
   components: {
     NavBar,
     FooterComponent
   },
   data() {
     return {
       form: {
         year: '2020',
         career: 'Derecho',
         lastName: '',
         motherEducation: ''
       }
     };
   },
   methods:{
    goToResume() {
    },
   }

 };
 </script>

  <style scoped>
  @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
  
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
  }
  
  header {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
  }
  
  .survey-container {
    padding-top: 80px;
    min-height: 100vh;
    background-color: #ffffff;
    display: flex;
    margin: 15px;
    justify-content: center;
    align-items: center;
  }
  
  .survey-form-container {
    background-color: #CBDADB;
    padding: 2rem;
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 48rem; /* Ancho ajustado */
    width: 100%;
  }
  
  .survey-title {
    font-size: 25px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 1.5rem;
    color: #000000;
  }
  
  .survey-form {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
  }
  
  .form-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    padding: 0px 10px;
  }
  
  .form-group label {
    font-size: 15px;
    font-weight: 500;
    color: #000000
  }
  
  .form-group select,
  .form-group input[type="text"] {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid #929292;;
    border-radius: 15px;
    font-size: 1rem;
  }
  
  .radio-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .form-actions {
    display: flex;
    justify-content: flex-end;
    margin-top: 1rem;
  }
  
  .submit-button {
    background-color: #263D42;
    color: white;
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 15px;
    font-size: 0.875rem;
    font-weight: 500;
    cursor: pointer;
  }
  
  .submit-button:hover {
    background-color: #263D42;
  }
  </style>
  