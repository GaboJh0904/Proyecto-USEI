<template>
  <div class="profile-popup">
    <div class="popup-wrapper">
      <div class="popup-content">
        <div class="color-bar"></div>
        <button class="close-btn" @click="closePopup">X</button>
        <h2>Mi Perfil</h2>
        <form>
          <div class="form-group">
            <label for="name">Nombre:</label>
            <div class="relative">
              <p class="static-data">{{ user.name }}</p>
              <i class="fa fa-user"></i>
            </div>
          </div>

          <!-- Mostrar Apellido solo si el rol es 'estudiante' -->
          <div v-if="user.rol === 'estudiante'" class="form-group">
            <label for="apellido">Apellido:</label>
            <div class="relative">
              <p class="static-data">{{ user.apellido }}</p>
              <i class="fa fa-user"></i>
            </div>
          </div>

          <!-- Mostrar Correo Institucional o Correo General según el rol -->
          <div class="form-group">
            <label for="email">{{ user.rol === 'estudiante' ? 'Correo Institucional' : 'Correo' }}:</label>
            <div class="relative">
              <p class="static-data">{{ user.email }}</p>
              <i class="fa fa-envelope"></i>
            </div>
          </div>

          <!-- Mostrar Teléfono solo si el rol es 'estudiante' -->
          <div v-if="user.rol === 'estudiante'" class="form-group">
            <label for="phone">Teléfono:</label>
            <div class="relative">
              <p class="static-data">{{ user.phone }}</p>
              <i class="fa fa-phone"></i>
            </div>
          </div>

          <div class="tright">
            <button class="movebtn movebtnedit" type="button" @click="showEditProfile"><i class="fa-solid fa-pen-to-square"></i> Editar</button>
            <button class="movebtn movebtnlogout" type="button" @click="logout"><i class="fa-solid fa-right-from-bracket"></i> Cerrar Sesión</button>
          </div>
        </form>
      </div>
    </div>

    <!-- Enviar solo los campos editables al componente de edición -->
    <EditProfilePopup
      v-if="showEditPopup"
      @close="closeEditPopup"
      :user="getEditableFields()"
      :is-admin="user.rol === 'Administrador'"
      @save="saveProfileChanges"
    />
  </div>
</template>

<script>
import EditProfilePopup from '@/components/EditProfilePopup.vue'
import { useRouter } from 'vue-router'; // Importar el enrutador

export default {
  name: 'UserProfilePopup',
  components: {
    EditProfilePopup
  },
  data() {
    return {
      user: {
        name: localStorage.getItem('nombre') || '',
        email: localStorage.getItem('correo') || localStorage.getItem('correoInsitucional') || '',
        phone: localStorage.getItem('telefono') || '',
        apellido: localStorage.getItem('apellido') || '',
        rol: localStorage.getItem('rol') || ''
      },
      showEditPopup: false // Controlar la visibilidad del pop-up de edición
    };
  },
  setup() {
    const router = useRouter(); // Obtener acceso al enrutador dentro del setup
    return { router };
  },
  methods: {
    closePopup() {
      this.$emit('close');
    },
    showEditProfile() {
      this.showEditPopup = true; 
    },
    closeEditPopup() {
      this.showEditPopup = false; 
    },
    getEditableFields() {
      // Retornar solo los campos que se pueden editar según el rol
      if (this.user.rol === 'Administrador') {
        return { name: this.user.name };
      } else if (this.user.rol === 'estudiante') {
        return { name: this.user.name, apellido: this.user.apellido, phone: this.user.phone };
      }
    },
    saveProfileChanges(updatedUser) {
      // Actualizar los datos del perfil según el rol
      Object.assign(this.user, updatedUser);
      this.closeEditPopup(); 
    },
    logout() {
      // Limpiar todos los datos del localStorage
      localStorage.clear();
      
      // Redirigir a la página de inicio
      this.router.push({ name: 'inicio' }); // Redirigir a la vista Página de inicio
    }
  }
};
</script>

  
  <style scoped>
  /* Estilos permanecen iguales */
  .profile-popup {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
  }
  
  .popup-wrapper {
    position: relative;
    width: 500px;
  }
  
  .popup-content {
    background: white;
    padding: 20px 30px;
    border-radius: 15px;
    width: 100%;
    box-shadow: 0 0 40px -10px #fff;
    position: relative;
    margin-top: -20px;
    overflow: hidden;
  }
  
  .color-bar {
    position: absolute;
    top: -3px;
    left: 0;
    width: 100%;
    height: 8px;
    background: linear-gradient(to right, #ccdbcd, #80ced7, #63c7b2, #8e6c88, #263d42);
    border-radius: 5px 5px 5px 5px;
  }
  
  .close-btn {
    position: absolute;
    top: 15px;
    right: 15px;
    background: none;
    border: none;
    font-size: 20px;
    cursor: pointer;
  }
  
  h2 {
    color: #263d42;
    font-size: 22px;
    border-bottom: 3px solid #80ced7;
    margin-bottom: 20px;
    padding-bottom: 10px;
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  .relative {
    position: relative;
  }
  
  .relative i {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    color: #444;
  }
  
  .static-data {
    font-size: 16px;
    padding: 10px;
    border: 2px solid #bebed2;
    border-radius: 15px;
    background-color: #f0f0f0;
  }
  
  .tright {
    text-align: right;
  }
  
  button.movebtn {
    padding: 10px 30px;
    margin: 8px;
    border-radius: 50px;
    font-family: 'Montserrat', sans-serif;
    font-size: 16px;
    font-weight: bold;
    background-color: #80ced7;
    color: black;
    border: none;
    transition: all 0.3s ease;
    cursor: pointer;
  }
  
  button.movebtnedit {
    background-color: #d3d3d3;
    color: black;
  }
  
  button.movebtnlogout {
    background-color: #80ced7;
    color: black;
  }
  
  button.movebtn:hover {
    background-color: #8e6c88;
    color: white;
  }
  </style>
  