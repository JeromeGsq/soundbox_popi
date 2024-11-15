# soundboard_popi

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Type Support for `.vue` Imports in TS

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) to make the TypeScript language service aware of `.vue` types.

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Type-Check, Compile and Minify for Production

```sh
npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```

```
// Récupération de toutes les requêtes réseau de la page via "performance.getEntries()"
const mp3Files = performance.getEntries()
    .filter(entry => entry.initiatorType === 'media' && entry.name.endsWith('.mp3'));

// Téléchargement de chaque fichier mp3 trouvé
mp3Files.forEach(file => {
    const url = file.name;
    const filename = url.split("/").pop(); // Extrait le nom du fichier à partir de l'URL
    download(url, filename);
});
```
