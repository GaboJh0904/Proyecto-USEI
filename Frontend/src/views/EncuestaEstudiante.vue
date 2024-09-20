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
        <form @submit.prevent="goToResume" class="survey-form">
          <!-- Año de ingreso -->
          <div class="form-group">
            <label for="year">Año que ingresó a la U.C.B.</label>
            <select id="year" v-model="answers['1']">
              <option value="2019">2019</option>
              <option value="2018">2018</option>
              <option value="2017">2017</option>
              <option value="2016">2016</option>
              <option value="2015">2015</option>
              <option value="2014">2014</option>
              <option value="2013">2013</option>
              <option value="2012">2012</option>
              <option value="2011">2011</option>
              <option value="2010">2010</option>
              <option value="2009">2009</option>
              <option value="2008">2008</option>
              <option value="2007">2007</option>
              <option value="2006">2006</option>
              <option value="2005">2005</option>
              <option value="2004">2004</option>
              <option value="2003">2003</option>
              <option value="2002">2002</option>
              <option value="2001">2001</option>
              <option value="2000">2000</option>
              <option value="ANTES 2000">ANTES 2000</option>
            </select>
          </div>
          <!-- Carrera -->
          <div class="form-group">
            <label for="career">Carrera de la que se graduó</label>
            <select id="career" v-model="answers['2']">
              <option value="Administración de Empresas">Administración de Empresas</option>
              <option value="Administración Turística">Administración Turística</option>
              <option value="Contaduría Pública">Contaduría Pública</option>
              <option value="Economía">Economía</option>
              <option value="Economía e Inteligencia de Negocios">Economía e Inteligencia de Negocios</option>
              <option value="Ingeniería Comercial">Ingeniería Comercial</option>
              <option value="Ingeniería en Innovación Empresarial">Ingeniería en Innovación Empresarial</option>
              <option value="Marketing y Medios Digitales">Marketing y Medios Digitales</option>
              <option value="Ingeniería Ambiental">Ingeniería Ambiental</option>
              <option value="Ingeniería Biomédica">Ingeniería Biomédica</option>
              <option value="Ingeniería Bioquímica y de Bioprocesos">Ingeniería Bioquímica y de Bioprocesos</option>
              <option value="Ingeniería Civil">Ingeniería Civil</option>
              <option value="Ingeniería en Energía">Ingeniería en Energía</option>
              <option value="Ingeniería en Multimedia e Interactividad Digital">Ingeniería en Multimedia e Interactividad Digital</option>
              <option value="Ingeniería en Logística y Analítica de la Cadena de Suministro">Ingeniería en Logística y Analítica de la Cadena de Suministro</option>
              <option value="Ingeniería Industrial">Ingeniería Industrial</option>
              <option value="Ingeniería Mecatrónica">Ingeniería Mecatrónica</option>
              <option value="Ingeniería Química">Ingeniería Química</option>
              <option value="Ingeniería en Sistemas">Ingeniería en Sistemas</option>
              <option value="Ingeniería en Telecomunicaciones">Ingeniería en Telecomunicaciones</option>
            </select>
          </div>
            <!-- Apellido paterno -->
          <div class="form-group">
            <label for="lastName1">Apellido Paterno</label>
            <input type="text" id="lastName1" v-model="answers['3']"
            @input="validateTextInput($event, '3')" >
            </div>
            <!-- Apellido materno -->
          <div class="form-group">
            <label for="lastName2">Apellido Materno</label>
            <input type="text" id="lastName2" v-model="answers['4']"
            @input="validateTextInput($event, '4')">          
          </div>
            <!-- Nombres -->
          <div class="form-group">
            <label for="names">Nombres</label>
            <input type="text" id="names" v-model="answers['5']"
            @input="validateTextInput($event, '5')"
            >
          </div>
          <!-- Edad -->
          <div class="form-group">
            <label for="age">Edad</label>
            <input type="number" id="age" v-model="answers['6']">
          </div>
            <!-- Sexo -->
          <div class="form-group">
            <label>Sexo</label>
            <div class="radio-group">
              <div class="radio-option">
                <input id="gender" type="radio" v-model="answers['7']" value="Mujer">
                <label for="fame">Mujer</label>
              </div>
              <div class="radio-option">
                <input id="gender" type="radio" v-model="answers['7']" value="Varón">
                <label for="male">Varón</label>
              </div>
            </div>
          </div>
            <!-- Telefono fijo -->
            <div class="form-group">
              <label for="telephone">Teléfono</label>
              <input type="tel" id="telephone" v-model="answers['8']"
            @input="validatePhoneInput($event, '8')"
            >            </div>
            <!-- Telefono movil -->
            <div class="form-group">
              <label for="telephone2">Teléfono móvil</label>
              <input type="tel" id="telephone2" v-model="answers['9']"
            @input="validatePhoneInput($event, '9')"
            >
            </div>
        <!--Ciudad -->
          <div class="form-group">
            <label for="city">Seleccione su ciudad de nacimiento</label>
            <select id="city" v-model="answers['10']">
              <option value="La Paz">La Paz</option>
              <option value="Santa Cruz">Santa Cruz</option>
              <option value="Cochabamba">Cochabamba</option>
              <option value="Sucre">Sucre</option>
              <option value="Oruro">Oruro</option>
              <option value="Potosí">Potosí</option>
              <option value="Tarija">Tarija</option>
              <option value="Trinidad">Trinidad</option>
              <option value="Cobija">Cobija</option>
              <option value="El Alto">El Alto</option>
              <option value="Otro">Otro</option>
            </select>
          </div>
           <!-- Cédula de Identidad -->
          <div class="form-group">
            <label for="idcard">Cédula de identidad</label>
            <input type="text" id="idcard" v-model="answers['11']">
          </div>
          <!-- Estado Civil -->
          <div class="form-group">
            <label>Indique su Estado Civil actual</label>
            <div class="radio-group">
              <div class="radio-option">
                <input id="civil-single" type="radio" v-model="answers['12']" value="Soltero(a)">
                <label for="civil-single">Soltero(a)</label>
              </div>
              <div class="radio-option">
                <input id="civil-married" type="radio" v-model="answers['12']" value="Casado(a)">
                <label for="civil-married">Casado(a)</label>
              </div>
              <div class="radio-option">
                <input id="civil-cohabitant" type="radio" v-model="answers['12']" value="Concubino(a)">
                <label for="civil-cohabitant">Concubino(a)</label>
              </div>
              <div class="radio-option">
                <input id="civil-divorced" type="radio" v-model="answers['12']" value="Divorciado(a)">
                <label for="civil-divorced">Divorciado(a)</label>
              </div>
              <div class="radio-option">
                <input id="civil-widowed" type="radio" v-model="answers['12']" value="Viudo(a)">
                <label for="civil-widowed">Viudo(a)</label>
              </div>
            </div>
          </div>
          <div class="form-actions">
            <button class="volver-button" @click="goBack">Volver</button>
            <button class="submit-button">Siguiente</button>
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
import { useRouter } from 'vue-router';

export default {
  name: 'EncuestaEstudiante',
  components: {
    NavBar,
    FooterComponent
  },
  data() {
    return {
      answers: JSON.parse(localStorage.getItem('surveyAnswers')) || {}, // Cargar datos del LocalStorage
      estudianteId: null, // ID del estudiante que inició sesión
    };
  },
  mounted() {
    // Obtener el ID del estudiante desde localStorage
    this.estudianteId = localStorage.getItem('id_estudiante');
    if (!this.estudianteId) {
      alert('Por favor, inicie sesión antes de continuar.');
      this.$router.push({ name: '/' });
    }


    if (!this.$route.query.fromResume) {
      localStorage.removeItem('surveyAnswers');
    } else {
      this.answers = JSON.parse(localStorage.getItem('surveyAnswers')) || {};
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1);
    },
    
    goToResume() {
      // Validación para verificar si todos los campos requeridos están completos
      if (this.isFormComplete()) {
        this.$router.push({
          name: 'ResumePage',
          query: { ...this.answers, estudianteId: this.estudianteId }
        });
      } else {
        alert('Por favor, complete todos los campos obligatorios.');
      
      } 
    },
    isFormComplete() {
      // Verificar que todos los campos importantes estén llenos
      return this.answers['1'] && this.answers['2'] && this.answers['3'] &&
             this.answers['4'] && this.answers['5'] && this.answers['6'] &&
             this.answers['7'] && this.answers['8'] && this.answers['9'] &&
             this.answers['10'] && this.answers['11'] && this.answers['12'];
    },
    // Validar que el input solo permita letras y espacios
    validateTextInput(event, field) {
      const value = event.target.value.replace(/[^a-zA-Z\s]/g, ''); // Elimina todo excepto letras y espacios
      this.answers[field] = value;
    },
    // Validar que el input de teléfono solo permita números
    validatePhoneInput(event, field) {
      const value = event.target.value.replace(/\D/g, ''); // Elimina todo excepto dígitos
      this.answers[field] = value;
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
  max-width: 48rem;
  /* Ancho ajustado */
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
.form-group input[type="text"]{
  width: 100%;
  padding: 8px 12px;
  border: 1px solid #929292;
  border-radius: 15px;
  font-size: 1rem;
}
.form-group input[type="number"]{
  width: 100%;
  padding: 8px 12px;
  border: 1px solid #929292;
  border-radius: 15px;
  font-size: 1rem;
}
.form-group input[type="tel"]{
  width: 100%;
  padding: 8px 12px;
  border: 1px solid #929292;
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

.volver-button {
  background-color: #6c5b7b;
  color: white;
  padding: 0.5rem 1rem;
  margin-right: 50px;
  border: none;
  border-radius: 15px;
  font-size: 0.875rem;
  font-weight: 500;
  cursor: pointer;
}

.volver-button:hover {
  background-color: #6c5b7b;
}
</style>