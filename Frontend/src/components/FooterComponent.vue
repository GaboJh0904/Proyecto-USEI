<template>
    <footer class="footer">
      <div class="footer-container">
        <!-- Columna de logo y contacto -->
        <div class="footer-column">
          <img src="@/components/images/USEI.png" alt="Logo" class="footer-logo" />
          <p>Teléfono: 378 78 12609</p>
          <p>usei@ucb.edu.bo</p>
          <div class="social-icons">
            <a href="https://facebook.com" target="_blank">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="https://instagram.com" target="_blank">
              <i class="fab fa-instagram"></i>
            </a>
            <a href="https://wa.me/123456789" target="_blank">
              <i class="fab fa-whatsapp"></i>
            </a>
          </div>
        </div>
      </div>
  
      <!-- Barra inferior con copyright -->
      <div class="footer-bottom">
        <p>UCB 2024 - Todos los Derechos Reservados.</p>
      </div>
    </footer>
  </template>
  
  <script>
  export default {
    name: "FooterComponent",
  };
  </script>
  
  <style scoped>
  .footer {
    background-color: #ccdbdc;
    color: #263d42;
    padding: 40px 0 0 0;
    text-align: center;
    width: 100%;
  }
  
  .footer-container {
    display: flex;
    justify-content: center; /* Alinea el contenido al centro */
    align-items: center; /* Alinea el contenido verticalmente */
    flex-direction: column; /* Hace que los elementos se apilen en columna */
    max-width: 1200px;
    margin: 0 auto;
  }
  
  .footer-column {
    text-align: center; /* Alinea el texto al centro */
    margin: 30px;
  }
  
  .footer-logo {
    width: 280px;
    margin-bottom: 20px;
  }
  
  .social-icons {
    margin-top: 15px;
  }
  
  .social-icons a {
    color: #8E6C88;
    margin-right: 15px;
    font-size: 24px;
  }
  
  .social-icons a:hover {
    color: #263d42;
  }
  
  .footer-bottom {
    background-color: #63C7B2;
    padding: 15px 0;
    margin-top: 20px;
  }
  
  .footer-bottom p {
    margin: 0;
  }
  
  @media (max-width: 768px) {
    .footer-container {
      flex-direction: column;
      text-align: center;
    }
  
    .footer-column {
      width: 100%;
      margin-bottom: 30px;
    }
  }
  </style>
  