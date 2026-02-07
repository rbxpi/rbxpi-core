import { viteBundler } from '@vuepress/bundler-vite'
import { defineUserConfig } from 'vuepress'
import { plumeTheme } from 'vuepress-theme-plume'

export default defineUserConfig({
  base: "/rbxpi-core/",
  lang: 'en-US',

  locales: {
    '/': { title: 'RbxPI', lang: 'en-US' },
    '/fr/': { title: 'RbxPI', lang: 'fr' },
  },

  head: [
    ['link', { rel: 'icon', type: 'image/png', href: '/favicon-32x32.png' }],
  ],

  bundler: viteBundler(),
  shouldPrefetch: false, 

  theme: plumeTheme({
    markdown: {
      codeTree: true, 
      field: true, 
      abbr: true, 
      table: {
        align: 'left',
        maxContent: false,
        fullWidth: true,
      }
    },

    contributors: true,

    cache: 'filesystem',
    search: { provider: 'local' },
  }),
})