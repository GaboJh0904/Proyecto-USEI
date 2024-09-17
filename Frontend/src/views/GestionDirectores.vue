<template>
    <div>
      <header>
        <NavBar userRole="Admin" />
      </header>
  
      <main class="user-management-container">
        <h1 class="user-management-title">Gestión de Directores</h1>
  
        <!-- Formulario para añadir/editar usuarios -->
        <div class="user-form-container">
          <h2>{{ isEditing ? "Editar Usuario" : "Añadir Usuario" }}</h2>
          <form @submit.prevent="isEditing ? updateUser() : addUser()">
            <!-- Nombre -->
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" id="nombre" v-model="currentUser.nombre" required />
            </div>
  
            <!-- Teléfono -->
            <div class="form-group">
              <label for="telefono">Teléfono</label>
              <input type="tel" id="telefono" v-model="currentUser.telefono" required />
            </div>
  
            <!-- Correo -->
            <div class="form-group">
              <label for="correo">Correo</label>
              <input type="email" id="correo" v-model="currentUser.correo" required />
            </div>
  
            <!-- Usuario -->
            <div class="form-group">
              <label for="usuario">Usuario</label>
              <input type="text" id="usuario" v-model="currentUser.usuario" required />
            </div>
  
            <!-- Contraseña -->
            <div class="form-group">
              <label for="contrasenia">Contraseña</label>
              <input type="password" id="contrasenia" v-model="currentUser.contrasenia" required />
            </div>
  
            <!-- Botón para añadir/editar -->
            <div class="form-actions">
              <button type="submit" class="submit-button">{{ isEditing ? "Actualizar" : "Añadir" }}</button>
            </div>
          </form>
        </div>
  
        <!-- Tabla de usuarios -->
        <div class="user-table-container">
          <h2>Usuarios Registrados</h2>
          <table>
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Correo</th>
                <th>Usuario</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in users" :key="user.id">
                <td>{{ user.nombre }}</td>
                <td>{{ user.telefono }}</td>
                <td>{{ user.correo }}</td>
                <td>{{ user.usuario }}</td>
                <td>
                  <button @click="editUser(user)">Editar</button>
                  <button @click="deleteUser(user.id)">Eliminar</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
  
      <FooterComponent />
    </div>
  </template>
<script>
import NavBar from '@/components/NavBar.vue';
import FooterComponent from '@/components/FooterComponent.vue';

export default {
  name: 'GestionDir',
  components: {
    NavBar,
    FooterComponent
  },
  data() {
    return {
      users: [], // Lista de usuarios
      currentUser: {
        nombre: '',
        telefono: '',
        correo: '',
        usuario: '',
        contrasenia: ''
      }, // Usuario que se está añadiendo/editando
      isEditing: false, // Si estamos editando o no
      editUserId: null // Almacenar el ID del usuario que se está editando
    };
  },
  methods: {
    // Añadir un nuevo usuario
    addUser() {
      const newUser = { ...this.currentUser, id: Date.now() }; // Simulando ID único
      this.users.push(newUser);
      this.resetForm();
    },

    // Editar un usuario existente
    editUser(user) {
      this.isEditing = true;
      this.editUserId = user.id;
      this.currentUser = { ...user }; // Cargar los datos del usuario en el formulario
    },

    // Actualizar un usuario existente
    updateUser() {
      const index = this.users.findIndex(user => user.id === this.editUserId);
      if (index !== -1) {
        this.users.splice(index, 1, { ...this.currentUser, id: this.editUserId });
        this.resetForm();
        this.isEditing = false;
      }
    },

    // Eliminar un usuario
    deleteUser(userId) {
      this.users = this.users.filter(user => user.id !== userId);
    },

    // Resetear el formulario
    resetForm() {
      this.currentUser = {
        nombre: '',
        telefono: '',
        correo: '',
        usuario: '',
        contrasenia: ''
      };
      this.isEditing = false;
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

.user-management-container {
  padding-top: 80px;
  min-height: 100vh;
  background-color: #ffffff;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 15px;
}

.user-management-title {
  font-size: 25px;
  font-weight: bold;
  color: #000000;
  margin-bottom: 1.5rem;
}

.user-form-container,
.user-table-container {
  background-color: #CBDADB;
  padding: 2rem;
  border-radius: 15px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 48rem;
  margin-bottom: 1.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  font-size: 15px;
  font-weight: 500;
  color: #000000;
}

.form-group input {
  width: 100%;
  padding: 8px 12px;
  border: 1px solid #929292;
  border-radius: 15px;
  font-size: 1rem;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
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
  background-color: #1F2E34;
}

.user-table-container table {
  width: 100%;
  border-collapse: collapse;
}

.user-table-container th,
.user-table-container td {
  border: 1px solid #263D42;
  padding: 12px;
  text-align: left;
}

.user-table-container th {
  background-color: #263D42;
  color: white;
}

.user-table-container td button {
  background-color: #263D42;
  color: white;
  padding: 0.25rem 0.75rem;
  border: none;
  border-radius: 10px;
  cursor: pointer;
}

.user-table-container td button:hover {
  background-color: #1F2E34;
}
</style>
