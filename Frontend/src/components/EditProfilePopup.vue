<template>
    <div class="edit-profile-popup">
      <div class="popup-wrapper">
        <div class="popup-content">
          <div class="color-bar"></div>
          <button class="close-btn" @click="closePopup">X</button>
          <h2>Editar Perfil</h2>
          <form @submit.prevent="saveChanges">
            <!-- Campo Nombre (Editable para ambos) -->
            <div class="form-group">
              <label for="name">Nombre:</label>
              <div class="relative">
                <input class="form-control" id="name" type="text" v-model="user.name" required placeholder="Escribe tu nombre..." />
                <i class="fa fa-user"></i>
              </div>
            </div>
  
            <!-- Campo Apellido (Solo editable para estudiantes) -->
            <div v-if="!isAdmin" class="form-group">
              <label for="apellido">Apellido:</label>
              <div class="relative">
                <input class="form-control" id="apellido" type="text" v-model="user.apellido" required placeholder="Escribe tu apellido..." />
                <i class="fa fa-user"></i>
              </div>
            </div>
  
            <!-- Campo Teléfono (Solo editable para estudiantes) -->
            <div v-if="!isAdmin" class="form-group">
              <label for="phone">Teléfono:</label>
              <div class="relative">
                <input class="form-control" id="phone" type="text" v-model="user.phone" required placeholder="Escribe tu teléfono..." />
                <i class="fa fa-phone"></i>
              </div>
            </div>
  
            <div class="tright">
              <button class="movebtn movebtnsave" type="submit">Guardar Cambios</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "EditProfilePopup",
    props: {
      user: Object, // Recibe los campos que se pueden editar
      isAdmin: Boolean // Determina si el usuario es un administrador
    },
    methods: {
      closePopup() {
        this.$emit('close');
      },
      saveChanges() {
        // Emitir los datos editados al componente padre (UserProfilePopup.vue)
        this.$emit('save', this.user);
      }
    }
  };
  </script>
  

<style scoped>
.edit-profile-popup {
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
    border-radius: 8px;
    width: 100%;
    box-shadow: 0 0 40px -10px #fff;
    position: relative;
}
.color-bar {
    position: absolute;
    top: -3px;
    left: 0;
    width: 100%;
    height: 8px;
    background: linear-gradient(to right, #ccdbcd, #80ced7, #63c7b2, #8e6c88, #263d42);
    border-radius: 5px 5px 0 0;
}
.close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    background: none;
    border: none;
    font-size: 24px;
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
.form-control {
    width: 100%;
    padding: 10px;
    border: 2px solid #bebed2;
    border-radius: 5px;
    background-color: #f0f0f0;
    outline: none;
    transition: border-color 0.3s ease;
}
.form-control:focus {
    border-color: #1e439b;
    box-shadow: 0 0 8px rgba(30, 102, 195, 0.8);
}
.relative i {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    color: #444;
}
.tright {
    text-align: right;
}
button.movebtnsave {
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
button.movebtnsave:hover {
    background-color: #8e6c88;
    color: white;
}
</style>
