import { defineThemeConfig } from 'vuepress-theme-plume'
import { enCollections, frCollections } from './collections/index.js'
import { enNavbar, frNavbar } from './navbar'

export default defineThemeConfig({
  logo: '/blockguard-sf-logo.png',

  profile: {
    avatar: '/blockguard-sf-logo.png',
    name: 'RbxPI',
    description: 'Roblox Package Index',
    circle: true,
    location: 'France',
    organization: 'BlockGuard SF',
  },

  
  appearance: true,

  transition: { appearance: 'circle-clip' },

  social: [
    { icon: 'github', link: 'https://github.com/rbxpi/rbxpi-core' },
    { icon: 'roblox', link: 'https://create.roblox.com/store/asset/72160239405840/RbxPI-Roblox-Package-Index' },
    { icon: 'discord', link: 'https://discord.gg/WNKh6avffr' },
  ],
  navbarSocialInclude: ['github', 'discord', 'roblox'],

  footer: {
    copyright: 'Copyright © 2025-present BlockGuard Software Foundation',
  },

  locales: {
    '/': {
      navbar: enNavbar,
      collections: enCollections,
    },
    '/fr/': {
      navbar: frNavbar,
      collections: frCollections,
    },
  },
})