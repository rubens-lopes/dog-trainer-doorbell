<template>
  <div id="app">
    <AudioPlayer />
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import AudioPlayer from "./components/AudioPlayer.vue";

export default Vue.extend({
  name: "App",
  components: {
    AudioPlayer
  }
});
</script>

<style scoped lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: flex;
  height: 100vh;
  width: 100vw;
  justify-content: center;
  align-items: center;
}
</style>
