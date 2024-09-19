<template>
  <div class="popup-overlay" @click.self="$emit('close')">
    <div class="popup-content">
      <button class="close-btn" @click="$emit('close')">&times;</button>
      <h2>Registro de Estudiante</h2>
      <div class="popup-form-scroll">
        <form @submit.prevent="handleSubmit">
          <!-- CI -->
          <div class="form-group">
            <label for="ci">Cédula de identidad</label>
            <input type="text" id="ci" v-model="ci" required>
          </div>
          <!-- Nombre -->
          <div class="form-group">
            <label for="name">Nombre</label>
            <input type="text" id="name" v-model="nombre" required>
          </div>
          <!-- Apellido -->
          <div class="form-group">
            <label for="apellido">Apellido</label>
            <input type="text" id="apellido" v-model="apellido" required>
          </div>
          <!-- Correo institucional -->
          <div class="form-group">
            <label for="institutional-email">Correo institucional</label>
            <input type="email" id="institutional-email" v-model="correoInstitucional" required>
          </div>
          <!-- Correo personal -->
          <div class="form-group">
            <label for="personal-email">Correo personal</label>
            <input type="email" id="personal-email" v-model="correoPersonal" required>
          </div>
          <!-- Carrera -->
          <div class="form-group">
            <label for="career">Carrera</label>
            <select id="career" v-model="carrera" required>
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
          <!-- Asignatura -->
          <div class="form-group">
            <label for="asignatura">Asignatura de la carrera que cursa actualmente</label>
            <input type="text" id="asignatura" v-model="asignatura" required>
          </div>
          <!-- Teléfono -->
          <div class="form-group">
            <label for="phone">Teléfono</label>
            <input type="tel" id="phone" v-model="telefono" required>
          </div>
          <!-- Año -->
          <div class="form-group">
            <label for="anio">Año de inscripción a la universidad</label>
            <input type="number" id="anio" v-model="anio" required>
          </div>
          <!-- Semestre -->
          <div class="form-group">
            <label for="semestre">Semestre en el que se inscribió</label>
            <select id="semestre" v-model="semestre" required>
              <option value="1">1</option>
              <option value="2">2</option>
            </select>
          </div>
          <!-- Botón de enviar -->
          <button type="submit" class="submit-btn">Registrar</button>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  name: 'RegisterPopup',
  data() {
    return {
      ci: '',
      nombre: '',
      apellido: '',
      correoInstitucional: '',
      correoPersonal: '',
      carrera: '', 
      asignatura: '',
      telefono: '',
      anio: '',
      semestre: '',
    };
  },
  methods: {
    async handleSubmit() {
      const estudianteData = {
        ci: this.ci,
        nombre: this.nombre,
        apellido: this.apellido,
        correoInsitucional: this.correoInstitucional,
        correoPersonal: this.correoPersonal,
        carrera: this.carrera,
        asignatura: this.asignatura,
        telefono: this.telefono,
        anio: this.anio,
        semestre: this.semestre
      };

      try {
        const response = await axios.post('http://localhost:8082/estudiante', estudianteData, {
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
        });

        console.log('Registro exitoso:', response.data);

        // Realiza alguna acción después de un registro exitoso, como cerrar el popup o mostrar un mensaje de éxito
        this.$emit('close');
      } catch (error) {
        console.error('Error en el registro:', error.response ? error.response.data : error.message);
        // Maneja el error aquí, como mostrar un mensaje de error en el formulario
      }
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

.popup-content {
  background-color: white;
  padding: 20px;
  border: 5px solid #8E6C88;
  border-radius: 15px;
  position: relative;
  width: 370px;
  z-index: 1001;
  max-height: 80vh; /* Limita la altura del contenido */
  display: flex;
  flex-direction: column;
}

.popup-form-scroll {
  overflow-y: auto; /* Habilita el scroll */
  max-height: 70vh;
  margin-right: -20px;
  margin-left: 0px;
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

.form-group input, .form-group select {
  width: 100%;
  padding: 8px;
  border: 1px solid #929292;
  border-radius: 15px;
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
  font-size: 17px;
  background-color: #8E6C88;
  color: white;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  margin-top: 10px;
}

.submit-btn:hover {
  background-color: #63C7B2;
}
</style>
