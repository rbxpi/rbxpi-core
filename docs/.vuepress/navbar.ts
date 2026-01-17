import { defineNavbarConfig } from 'vuepress-theme-plume'

export const enNavbar = defineNavbarConfig([
  {
    text: 'Docs',
    items: [
      { text: 'Guide', link: 'guide/intro' },
      { text: 'Quick Start', link: 'guide/quick-start' },
      { text: 'BLuau Docs', link: 'https://blockguard-sf.github.io/BLuau/' }
    ]
  },
  {
    text: "API",
    link: "/api/README"
  }
])

export const frNavbar = defineNavbarConfig([
  {
    text: 'Docs',
    items: [
      { text: 'Guide', link: 'fr/guide/intro' },
      { text: 'Démarrage Rapide', link: 'fr/guide/quick-start' },
      { text: 'BLuau Docs', link: 'https://blockguard-sf.github.io/BLuau/' }
    ]
  },
  {
    text: "API",
    link: "fr/api/README"
  }
])