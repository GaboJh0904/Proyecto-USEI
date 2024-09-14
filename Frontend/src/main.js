import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import '@fortawesome/fontawesome-free/css/all.css';
import './assets/main.css'

createApp(App).use(router).mount('#app')