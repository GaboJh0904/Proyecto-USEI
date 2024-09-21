<template>
  <div>
    <header>
      <NavBar userRole="Student" />
    </header>

    <main class="resume-container">
      <h1 class="resume-title">Revisión de Respuestas</h1>

      <!-- Contenedor único para todas las respuestas -->
      <div class="resume-form">
        <p><strong>Año de ingreso:</strong> {{ form['1'] }}</p>
        <p><strong>Carrera:</strong> {{ form['2'] }}</p>
        <p><strong>Apellido Paterno:</strong> {{ form['3'] }}</p>
        <p><strong>Apellido Materno:</strong> {{ form['4'] }}</p>
        <p><strong>Nombres:</strong> {{ form['5'] }}</p>
        <p><strong>Edad:</strong> {{ form['6']}}</p>
        <p><strong>Sexo:</strong> {{ form['7'] }}</p>
        <p><strong>Teléfono Fijo:</strong> {{ form['8'] }}</p>
        <p><strong>Teléfono Móvil:</strong> {{ form['9'] }}</p>
        <p><strong>Ciudad de Nacimiento:</strong> {{ form['10'] }}</p>
        <p><strong>Cédula de Identidad:</strong> {{ form['11'] }}</p>
        <p><strong>Estado Civil:</strong> {{ form['12'] }}</p>
        
        
        <div class="form-actions">
          <button class="back-button" @click="goBackToSurvey">Regresar a la Encuesta</button>
          <button class="submit-button" @click="submitForm">Enviar</button>
        </div>
      </div>
    </main>

    <FooterComponent />
  </div>
</template>

<script>
import NavBar from '@/components/NavBar.vue';
import FooterComponent from '@/components/FooterComponent.vue';
import { useRouter } from 'vue-router';
import axios from 'axios';

export default {
  name: 'ResumePage',
  components: {
    NavBar,
    FooterComponent
  },
  data() {
    return {
      form: this.$route.query // Recibe los datos del formulario a través de query params
    };
  },
  methods: {
    goBackToSurvey() {
      localStorage.setItem('surveyAnswers', JSON.stringify(this.form));
      this.$router.push({ name: 'encuestaEstudiante', query: { fromResume: true } });

    },
    async submitSurvey() {
      try {
        const estudianteId = this.form.estudianteId;
        if (!estudianteId) {
          throw new Error('El ID del estudiante no esta disponible.');
        }

        // Iterar sobre las respuestas para enviar cada una con el ID de la pregunta
        for (const [preguntaId, respuesta] of Object.entries(this.form)) {
          if (preguntaId !== 'estudianteId') {
            await axios.post('http://localhost:8082/respuesta', {
              respuesta: respuesta,
              preguntaIdPregunta: { idPregunta: preguntaId },
              estudianteIdEstudiante: { idEstudiante: estudianteId }
            });
          }
        }

        alert('Encuesta enviada con éxito');
        localStorage.removeItem('surveyAnswers'); // Limpiar LocalStorage después de enviar
        this.$router.push('/menu-estudiante');
      } catch (error) {
        console.error('Detalles del error:', error);
        alert('Error al enviar la encuesta. Vuelve a intentar.');
      }
    }
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

.resume-container {
  padding-top: 80px;
  min-height: 100vh;
  background-color: #ffffff;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  margin: 15px;
}

.resume-form {
  background-color: #CBDADB;
  padding: 2rem;
  border-radius: 15px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 48rem;
}

.resume-title {
  font-size: 25px;
  font-weight: bold;
  color: #000000;
  text-align: left;
  margin-bottom: 1.5rem;
}

.resume-form p {
  font-size: 1rem;
  color: #000000;
  margin-bottom: 1rem;
}

.resume-form strong {
  font-weight: 500;
  color: #263D42;
}

.form-actions {
  display: flex;
  justify-content: space-between;
  margin-top: 1rem;
  width: 100%;
}

.submit-button, .back-button {
  background-color: #263D42;
  color: white;
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 15px;
  font-size: 0.875rem;
  font-weight: 500;
  cursor: pointer;
}

.submit-button:hover, .back-button:hover {
  background-color: #1F2E34;
}
</style>