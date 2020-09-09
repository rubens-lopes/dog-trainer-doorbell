<template>
  <div>
    <audio
      ref="audioPlayer"
      @play="configurarContadorRegressivo"
      @pause="ligarCronometros"
    >
      <source src="audios/doorbell.ogg" type="audio/ogg" />
      <source src="audios/doorbell.mp3" type="audio/mp3" />
    </audio>
    <label v-show="ligado">Vai tocar em {{ contagemRegressiva }}</label>
    <div v-show="!ligado">
      <input type="number" v-model="duracao" /> em minutos
    </div>
    <button @click="tocarPausar">{{ acao }}</button>
  </div>
</template>

<script>
const UM_SEGUNDO_EM_MILESEGUNDOS = 1000;

export default {
  name: "AudioPlayer",
  data: () => ({
    ligado: false,
    duracao: 7,
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
  destroyed() {
    clearInterval(this.contadorRegressivo);
    clearTimeout(this.cronometro);
  },
  methods: {
    tocar() {
      this.$refs.audioPlayer && this.$refs.audioPlayer.play();
    },
    tocarPausar() {
      this.ligado ? this.desligarCronometros() : this.tocar();
    },
    configurarContadorRegressivo() {
      clearInterval(this.contadorRegressivo);
      this.contagemRegressiva = this.duracaoEmSegundos;
    },
    ligarCronometros() {
      this.ligado = true;
      this.contadorRegressivo = setInterval(() => {
        this.contagemRegressiva--;
      }, UM_SEGUNDO_EM_MILESEGUNDOS);

      this.cronometro = setTimeout(() => {
        this.tocar();
      }, this.duracaoEmSegundos * UM_SEGUNDO_EM_MILESEGUNDOS);
    },
    desligarCronometros() {
      this.ligado = false;
      this.$refs.audioPlayer.pause();
      clearTimeout(this.cronometro);
    }
  }
};
</script>
