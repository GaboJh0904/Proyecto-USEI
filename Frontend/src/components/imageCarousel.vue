<template>
  <div class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>
    <div class="gallery-cell" v-for="(image, index) in images" :key="index">
      <img :src="image" alt="Image" />
    </div>
  </div>
</template>

<script>
import 'flickity/css/flickity.css';
import Flickity from 'flickity';

export default {
  name: "FlickityCarousel",
  data() {
    return {
      images: [
        '/src/components/images/graduacion1.jpeg',
        '/src/components/images/maquetaUSEI.jpg',
        '/src/components/images/ucb.jpeg'
      ]
    };
  },
  mounted() {
    this.flickity = new Flickity(this.$el, {
      wrapAround: true
    });
  }
};
</script>

<style scoped>
/* external css: flickity.css */

* {
  box-sizing: border-box;
}

.gallery {
  background: #EEE;
}

.gallery-cell {
  width: 100%; /* Mantén el ancho al 100% */
  height: 500px; /* Ajusta la altura para que sea más alta */
  margin-right: 10px;
  background: #8C8;
}

.gallery-cell img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
