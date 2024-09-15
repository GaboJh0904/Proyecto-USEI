import { createRouter, createWebHistory } from 'vue-router'
import PaginaInicio from '../views/PaginaInicio.vue'
import MenuEstudiante from '../views/MenuEstudiante.vue' // Importa la nueva vista
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
    }
  ]
})

export default router
