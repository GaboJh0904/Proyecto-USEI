import { createRouter, createWebHistory } from 'vue-router'
import PaginaInicio from '../views/PaginaInicio.vue'
import MenuEstudiante from '../views/MenuEstudiante.vue' // Importa la nueva vista
import MenuAdministrador from '../views/MenuAdministrador.vue' // Importa la nueva vista
import MenuDirector from '../views/MenuDirector.vue' // Importa la nueva vista
import EncuestaEstudiante from '../views/EncuestaEstudiante.vue'
import ResumePage from '../views/ResumePage.vue' // Importa la nueva vista
import GestionDirectores from '../views/GestionDirectores.vue'
import EnviarEncuesta from '../views/EnviarEncuesta.vue'
import EnProgreso from '@/views/EnProgreso.vue'
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/', // Ruta principal
      name: 'inicio',
      component: PaginaInicio
    },
    {
      path: '/menu-estudiante', // Ruta MenuEstudiante
      name: 'menuEstudiante',
      component: MenuEstudiante
    },
    {
      path: '/menu-administrador', // Ruta MenuAdministrador
      name: 'menuAdministrador',
      component: MenuAdministrador
    },
    {
      path: '/menu-director', // Ruta MenuDirector
      name: 'menuDirector',
      component: MenuDirector
    },
    {
      path:'/encuesta-estudiante',
      name: 'encuestaEstudiante',
      component: EncuestaEstudiante
    },
    {
      path: '/resume', // Ruta ResumePage
      name: 'ResumePage',
      component: ResumePage
    },
    {
      path: '/gestion-directores', // Ruta ResumePage
      name: 'GestionDirectores',
      component: GestionDirectores
    },
    {
      path: '/enviar-encuesta', // Ruta ResumePage
      name: 'EnviarEncuesta',
      component: EnviarEncuesta
    },
    {
      path: '/en-progreso', // Nueva ruta
      name: 'EnProgreso',
      component: EnProgreso
    }
  ]
})

export default router
