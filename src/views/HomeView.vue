<template>
  <div class="min-h-screen bg-green-500">
    <!-- Header section -->
    <header class="sticky top-0 bg-green-500 p-4 shadow-md z-50">
      <div class="max-w-7xl mx-auto">
        <h1 class="text-2xl font-bold mb-4 text-green-900 text-center">
          Popi's Sound Board
        </h1>
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
          class="aspect-square p-2 text-sm text-green-900 font-bold bg-[url('@/assets/images/button.png')] bg-cover bg-center hover:brightness-110 transition-all"
        >
          {{ sound.label }}
        </button>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

// Define sound type
type Sound = {
  id: number
  path: string
  label: string
}

const currentSoundLabel = ref(' ')

const audioPlayer = ref<HTMLAudioElement | null>(null)

const sounds: Sound[] = [
  { id: 1, path: './public/audio/bedtime.mp3', label: 'Bedtime' },
  { id: 2, path: './public/audio/bvcbvcb.mp3', label: 'BVC' },
  {
    id: 3,
    path: './public/audio/collen-eyes-effect.mp3',
    label: 'Collen Eyes',
  },
  { id: 4, path: './public/audio/ding-sound-effect.mp3', label: 'Ding' },
  {
    id: 5,
    path: './public/audio/discord-leave.mp3',
    label: 'Discord Leave',
  },
  {
    id: 6,
    path: './public/audio/discord-notification.mp3',
    label: 'Discord',
  },
  { id: 7, path: './public/audio/fart.mp3', label: 'Fart' },
  { id: 8, path: './public/audio/gta-v-notification.mp3', label: 'GTA V' },
  {
    id: 9,
    path: './public/audio/james-brown-i-got-you.mp3',
    label: 'James Brown',
  },
  { id: 10, path: './public/audio/movie_1.mp3', label: 'Movie' },
  {
    id: 11,
    path: './public/audio/perfect-fart.mp3',
    label: 'Perfect Fart',
  },
  {
    id: 12,
    path: './public/audio/roblox-eating.mp3',
    label: 'Roblox Eating',
  },
  {
    id: 13,
    path: './public/audio/roblox-explosion.mp3',
    label: 'Roblox Explosion',
  },
  { id: 14, path: './public/audio/ryuko-i-got-this.mp3', label: 'Ryuko' },
  { id: 15, path: './public/audio/snore-mimimimimimi.mp3', label: 'Snore' },
  {
    id: 16,
    path: './public/audio/wrong-answer-sound-effect.mp3',
    label: 'Wrong Answer',
  },
  { id: 17, path: './public/audio/yeet-sound-effect.mp3', label: 'Yeet' },
]

const playSound = async (sound: Sound) => {
  if (audioPlayer.value == null) {
    audioPlayer.value = new Audio()
  }
  currentSoundLabel.value = sound.label

  audioPlayer.value.src = sound.path
  audioPlayer.value.muted = false
  await audioPlayer.value.play()
}
</script>
