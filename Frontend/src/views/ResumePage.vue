<template>
  <div>
    <header>
      <NavBar userRole="Student" />
    </header>

    <main class="resume-container">
      <h1 class="resume-title">Revisión de Respuestas</h1>

      <!-- Contenedor único para todas las respuestas -->
      <div class="resume-form">
        <p><strong>Año de ingreso:</strong> {{ form.year }}</p>
        <p><strong>Carrera:</strong> {{ form.career }}</p>
        <p><strong>Apellido Paterno:</strong> {{ form.lastName1 }}</p>
        <p><strong>Apellido Materno:</strong> {{ form.lastName2 }}</p>
        <p><strong>Nombres:</strong> {{ form.names }}</p>
        <p><strong>Edad:</strong> {{ form.age }}</p>
        <p><strong>Sexo:</strong> {{ form.gender }}</p>
        <p><strong>Teléfono Fijo:</strong> {{ form.telephone }}</p>
        <p><strong>Teléfono Móvil:</strong> {{ form.telephone2 }}</p>
        <p><strong>Ciudad de Nacimiento:</strong> {{ form.city }}</p>
        <p><strong>Cédula de Identidad:</strong> {{ form.idcard }}</p>
        <p><strong>Estado Civil:</strong> {{ form.civilStatus }}</p>
        
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
    submitForm() {
      // Aquí enviarías los datos al servidor
      console.log(this.form);
      alert('Formulario enviado con éxito');
      this.$router.push('/');
    },
    goBackToSurvey() {
      // Redireccionar de vuelta a la página de la encuesta
      this.$router.push({ name: 'encuestaEstudiante' });
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
