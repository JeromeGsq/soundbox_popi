<template>
  <div class="min-h-screen bg-green-500">
    <!-- Header section -->
    <header class="sticky top-0 bg-green-500 p-4 shadow-md z-50">
      <div class="max-w-7xl mx-auto">
        <h1 class="text-2xl font-bold mb-4 text-green-900 text-center">
          Popi's Sound Board
        </h1>
        <div>
          <audio ref="player" :src="currentSound" controls class="hidden" />
          <canvas ref="canvas" class="w-full"></canvas>
          <div class="text-center text-green-900 font-bold mt-2">
            {{ currentSoundLabel }}
          </div>
        </div>
      </div>
    </header>

    <div class="py-8"></div>

    <!-- Sound grid -->
    <main class="w-full max-w-[720px] mx-auto px-4">
      <div class="grid grid-cols-3 gap-3">
        <button
          v-for="sound in sounds"
          :key="sound.id"
          @click="playSound(sound)"
          class="aspect-square p-2 text-sm text-green-900 font-bold focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 bg-[url('@/assets/images/button.png')] bg-cover bg-center hover:brightness-110 transition-all"
        >
          {{ sound.label }}
        </button>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useAVLine } from 'vue-audio-visual'

// Define sound type
type Sound = {
  id: number
  path: string
  label: string
}

const player = ref<HTMLAudioElement | null>(null)
const canvas = ref<HTMLCanvasElement | null>(null)
const currentSound = ref('')
const currentSoundLabel = ref(' ')

// Initialize audio visualization
useAVLine(player, canvas, {
  canvHeight: 100,
  canvWidth: window.innerWidth,
  barColor: '#166534',
  fftSize: 256,
})

const sounds: Sound[] = [
  {
    id: 1,
    path: './src/assets/audio/discord-notification.mp3',
    label: 'Discord',
  },
  { id: 2, path: './src/assets/audio/movie_1.mp3', label: 'Movie' },
  { id: 3, path: './src/assets/audio/perfect-fart.mp3', label: 'Perfect Fart' },
  {
    id: 4,
    path: './src/assets/audio/snore-mimimimimimi.mp3',
    label: 'Snore',
  },
  {
    id: 5,
    path: './src/assets/audio/wrong-answer-sound-effect.mp3',
    label: 'Wrong Answer',
  },
]

const playSound = async (sound: Sound) => {
  if (!player.value) return

  player.value.src = sound.path
  currentSoundLabel.value = sound.label
  await player.value.play()
}
</script>
