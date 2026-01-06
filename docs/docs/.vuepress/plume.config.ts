import { defineThemeConfig } from 'vuepress-theme-plume'
import { enCollections, frCollections } from './collections'
import { enNavbar, frNavbar } from './navbar'

export default defineThemeConfig({
  logo: '/blockguard-sf-logo.png',

  appearance: true,

  social: [
    { icon: 'github', link: 'https://github.com/rbxpi/rbxpi-core' },
  ],

  locales: {
    '/': {
      profile: {
        avatar: '/blockguard-sf-logo.png',
        name: 'RbxPI',
        description: 'Roblox Package Index',
      },

      navbar: enNavbar,
      collections: enCollections,
    },
    '/fr/': {
      profile: {
        avatar: '/blockguard-sf-logo.png',
        name: 'RbxPI',
        description: 'Roblox Package Index',
      },

      navbar: frNavbar,
      collections: frCollections,
    },
  },
})