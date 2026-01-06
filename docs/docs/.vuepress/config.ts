import { viteBundler } from '@vuepress/bundler-vite'
import { defineUserConfig } from 'vuepress'
import { plumeTheme } from 'vuepress-theme-plume'

export default defineUserConfig({
  base: '/',
  lang: 'en-US',
  locales: {
    '/': { title: 'RbxPI', lang: 'en-US', description: 'Roblox Package Index' },
    '/fr/': { title: 'RbxPI', lang: 'fr', description: 'Roblox Package Index' },
  },

  // head: [
  // ['link', { rel: 'icon', type: 'image/png', href: '/favicon-32x32.png' }],
  // ],

  bundler: viteBundler(),
  shouldPrefetch: false, 

  theme: plumeTheme({
    cache: 'filesystem',
    search: { provider: 'local' },
  }),
})