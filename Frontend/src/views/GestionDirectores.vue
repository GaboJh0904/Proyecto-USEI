<template>
  <div>
    <header>
      <NavBar :userRole="userRole" />
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
            <button class="volver-button" @click="goBack">Volver</button>
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
            <tr v-for="user in users" :key="user.id_usuario">
              <td>{{ user.nombre }}</td>
              <td>{{ user.telefono }}</td>
              <td>{{ user.correo }}</td>
              <td>{{ user.usuario }}</td>
              <td>
                <button @click="editUser(user)">Editar</button>
                <button @click="deleteUser(user.id_usuario)">Eliminar</button>
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
import axios from 'axios';
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
      userRole: '',  // Añadir userRole para gestion-directores
      users: [], // Lista de usuarios
      currentUser: {
        nombre: '',
        telefono: '',
        correo: '',
        usuario: '',
        contrasenia: '',
        rol: 'Director' // Fijamos el rol como "Director"
      },
      isEditing: false, // Si estamos editando o no
      editUserId: null // Almacenar el ID del usuario que se está editando
    };
  },
  mounted() {
    // Obtener el rol del usuario desde el localStorage
    this.userRole = localStorage.getItem('rol') || '';

    // Cargar los usuarios cuando se monta el componente
    this.fetchUsers();
  },
  methods: {
    // Método para obtener la lista de usuarios desde el backend
    async fetchUsers() {
      try {
        const response = await axios.get('http://localhost:8082/usuario');
        this.users = response.data;
      } catch (error) {
        console.error('Error al cargar los usuarios:', error);
      }
    },

    // Añadir un nuevo usuario
    async addUser() {
      try {
        const response = await axios.post('http://localhost:8082/usuario', this.currentUser);
        this.users.push(response.data);
        this.resetForm();
      } catch (error) {
        console.error('Error al añadir el usuario:', error);
      }
    },

    // Editar un usuario existente
    editUser(user) {
      this.isEditing = true;
      this.editUserId = user.id_usuario;
      this.currentUser = { ...user }; // Cargar los datos del usuario en el formulario
    },

    // Actualizar un usuario existente
    async updateUser() {
      try {
        const response = await axios.put(`http://localhost:8082/usuario/${this.editUserId}`, this.currentUser);
        const index = this.users.findIndex(user => user.id_usuario === this.editUserId);
        if (index !== -1) {
          this.users.splice(index, 1, response.data);
        }
        this.resetForm();
        this.isEditing = false;
      } catch (error) {
        console.error('Error al actualizar el usuario:', error);
      }
    },

    // Eliminar un usuario
    async deleteUser(userId) {
      try {
        await axios.delete(`http://localhost:8082/usuario/${userId}`);
        this.users = this.users.filter(user => user.id_usuario !== userId);
      } catch (error) {
        console.error('Error al eliminar el usuario:', error);
      }
    },

    // Resetear el formulario
    resetForm() {
      this.currentUser = {
        nombre: '',
        telefono: '',
        correo: '',
        usuario: '',
        contrasenia: '',
        rol: 'Director'
      };
      this.isEditing = false;
    },
    goBack() {
      this.$router.go(-1); 
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
  margin-right: 1rem;
}

.volver-button:hover {
  background-color: #5A4766;
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
