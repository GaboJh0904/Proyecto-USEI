<template>
  <div>
    <!-- Header Section -->
    <section class="header-master">
      <header>
        <NavBar />
      </header>

      <div class="content-header">
        <div class="container">
          <ImageCarousel />
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section class="about">
      <div class="container">
        <div class="about-container">
          <img src="@/components/images/graduados.jpg" alt="" />
        </div>
        <div class="about-container">
          <h2>USEI</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sollicitudin enim quis ipsum efficiend imperdiet. Sed efficitur lacus ultricies. Pellentesque quis ultricies odio. Duis ante mauris, hendrerit ut odio at, efficitur commodo nisi.</p>
          
          <h2>USEI</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sollicitudin enim quis ipsum efficiend imperdiet. Sed efficitur lacus ultricies. Pellentesque quis ultricies odio. Duis ante mauris, hendrerit ut odio at, efficitur commodo nisi.</p>
        </section>
      </main>
    </div>
  </template>
  
  <script>
  export default {
    name: 'PaginaInicio',
  }
  </script>
  
  <style scoped>
  .pagina-inicio {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    font-family: Arial, sans-serif;
  }
  
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #5cd3b4;
    padding: 1rem;
  }
  
  .logo {
    background-color: white;
    padding: 0.5rem;
  }
  
  nav a {
    color: white;
    text-decoration: none;
    margin-left: 1rem;
  }
  
  main {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
  }
  
  .slider {
    position: relative;
    z-index: 2;
}

.about-container img{
    max-width: 100%;
}

.about-container h2{
    font-size: 33px;
    margin: 20px 0;
    color: #a9c4b8;
    font-weight: normal;
    padding: 5px 40px;
    text-align: center;
}

.about-container h2 b{
    color: #03ca9f;
}

footer{
    padding: 20px 0;
    background: #6cc5b2;
    text-align: center;
}


@media screen and (max-width: 916px){
    section.header-master{
        min-height: 400px;
    }
}
</style>
