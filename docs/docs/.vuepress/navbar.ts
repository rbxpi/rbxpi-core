import { defineNavbarConfig } from 'vuepress-theme-plume'

export const enNavbar = defineNavbarConfig([
])

export const frNavbar = defineNavbarConfig([
  {
    text: 'Docs',
    items: [
      { text: 'Guide', link: 'fr/guide/intro' },
      { text: 'Installation & Usage', link: 'fr/guide/quick-start' },
      { text: 'BLuau Docs', link: 'https://blockguard-sf.github.io/BLuau/' }
    ]
  },
])