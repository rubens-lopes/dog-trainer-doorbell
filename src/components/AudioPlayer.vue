<template>
  <div>
    <audio
      ref="audioPlayer"
      @play="configurarContadorRegressivo"
      @pause="ligarCronometros"
    >
      <source src="/audios/doorbell.ogg" type="audio/ogg" />
      <source src="/audios/doorbell.mp3" type="audio/mp3" />
    </audio>
    <label v-show="ligado">Vai tocar em {{ contagemRegressiva }}</label>
    <div v-show="!ligado">
      <input type="number" v-model="duracao" /> em minutos
    </div>
    <button @click="tocarPausar">{{ acao }}</button>
  </div>
</template>

<script>
export default {
  name: "AudioPlayer",
  data: () => ({
    ligado: false,
    duracao: 0.5,
    cronometro: 0,
    contagemRegressiva: 0,
    contadorRegressivo: 0
  }),
  computed: {
    acao() {
      return this.ligado ? "Parar" : "Tocar";
    },
    duracaoEmSegundos() {
      return this.duracao * 60;
    }
  },
  methods: {
    tocarPausar() {
      this.ligado ? this.desligarCronometros() : this.$refs.audioPlayer.play();
    },
    configurarContadorRegressivo() {
      this.ligado = true;
      clearInterval(this.contadorRegressivo);
      this.contagemRegressiva = this.duracaoEmSegundos;
    },
    ligarCronometros() {
      this.contadorRegressivo = setInterval(() => {
        this.contagemRegressiva--;
      }, 1000);

      this.cronometro = setTimeout(() => {
        this.$refs.audioPlayer.play();
      }, this.duracaoEmSegundos * 1000);
    },
    desligarCronometros() {
      this.ligado = false;
      this.$refs.audioPlayer.pause();
      clearTimeout(this.cronometro);
    }
  }
};
</script>
