import { defineThemeConfig } from 'vuepress-theme-plume'
import { enCollections, frCollections } from './collections'
import { enNavbar, frNavbar } from './navbar'

export default defineThemeConfig({
  logo: '/blockguard-sf-remove-bg-logo.png',

  profile: {
    avatar: '/blockguard-sf-remove-bg-logo.png',
    name: 'RbxPI',
    description: 'Roblox Package Index',
    location: 'France',
    organization: 'BlockGuard Software Foundation',
  },

  appearance: true,

  social: [
    { icon: 'github', link: 'https://github.com/rbxpi/rbxpi-core' },
  ],
  navbarSocialInclude: ['github'],

  footer: {
    copyright: 'Copyright © 2025-present BlockGuard Software Foundation',
  },

  locales: {
    '/': {
      profile: {
        // avatar: '/blockguard-sf-logo.png',
        name: 'RbxPI',
        description: 'Roblox Package Index',
      },

      navbar: enNavbar,
      collections: enCollections,
    },
    '/fr/': {
      profile: {
        // avatar: '/blockguard-sf-logo.png',
        name: 'RbxPI',
        description: 'Roblox Package Index',
      },

      navbar: frNavbar,
      collections: frCollections,
    },
  },
})