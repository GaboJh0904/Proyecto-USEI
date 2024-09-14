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
          <h2>Lorem ipsum dolor sit, amet consectetur adipisicing elit.Architecto possimus consectetur nostrum laborum, rerum unde autem aut consequatur quibusdam pariatur assumenda mollitia libero omnis quae?<b>Universidad Catolica Boliviana</b></h2>
        </div>
        <div class="clear"></div>
      </div>
    </section>

    <!-- Footer Section -->
    <FooterComponent />
  </div>
</template>

<script>
import NavBar from '@/components/NavBar.vue';
import ImageCarousel from '@/components/imageCarousel.vue';
import FooterComponent from '@/components/FooterComponent.vue';
export default {
  name: "LandingPage",
  components: {
    NavBar,
    ImageCarousel,
    FooterComponent  
  }
};
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto';
}

.clear{
    clear: both;
}

.container{
    max-width: 1280px;
    padding: 0 2%;
    margin: 50px auto;

}
/*Section Header-Master*/

section.header-master{
    width: 100%;
    padding: 30px 0;
    min-height: 700px;
    background-image: url('https://i.postimg.cc/28zkdsTq/bg-01.png');
    background-size: cover;
}

section.header-master header{
    border-bottom: 3px solid rgba(71, 83, 88, .14);
    padding-bottom: 20px;
}

.logo{
    float: left;
    width: 191px;
    height: 64px;
    background-image: url('@/components/images/USEI.png');
    background-size: 100% 100%;
}


.content-header{
    padding: 60px 0;
}

/*SECTION About*/

.about-container{
    float: left;
    width: 50%;
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