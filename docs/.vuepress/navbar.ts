import { defineNavbarConfig } from 'vuepress-theme-plume'

export const enNavbar = defineNavbarConfig([
  {
    text: 'Docs',
    items: [
      { text: 'Guide', link: 'guide/intro' },
      { text: 'Examples', link: 'examples/hello-world' },
      { text: 'Quick Start', link: 'guide/quick-start' },
      { text: 'Error Reference', link: 'error-reference' },
      { text: 'BLuau Docs', link: 'https://blockguard-sf.github.io/BLuau/' }
    ]
  },
  {
    text: "API",
    link: "/api/intro"
  },
  {
    text: "About",
    prefix: "about/",
    items: [
      { text: "Releases", link: "releases/" },
      { text: "Code of Conduct", link: "code-of-conduct" }
    ]
  },
  {
    text: "Community",
    items: [
      {
        text: "BlockGuard SF",
        items: [
          { text: "Discord Server", link: "https://discord.gg/WNKh6avffr" },
          { text: "Roblox Group", link: "https://www.roblox.com/communities/35439925/BlockGuard-Software-Foundation#!/about" },
          { text: "GitHub Organization", link: "https://github.com/blockguard-sf" },
        ],
      },
      {
        text: "RbxPI",
        items: [
          { text: "GitHub Repo", link: "https://github.com/rbxpi/rbxpi-core" },
          { text: "GitHub Organization", link: "https://github.com/rbxpi" },
        ],
      }
    ]
  }
])

export const frNavbar = defineNavbarConfig([
  {
    text: 'Docs',
    items: [
      { text: 'Guide', link: 'fr/guide/intro' },
      { text: 'Exemples', link: 'fr/examples/hello-world' },
      { text: 'Démarrage Rapide', link: 'fr/guide/quick-start' },
      { text: 'Référence des Erreurs', link: 'fr/error-reference' },
      { text: 'BLuau Docs', link: 'https://blockguard-sf.github.io/BLuau/' }
    ]
  },
  {
    text: "API",
    link: "fr/api/intro"
  },
  {
    text: "À propos",
    prefix: "fr/about/",
    items: [
      { text: "Releases", link: "releases/" },
      { text: "Code de conduite", link: "code-of-conduct" }
    ]
  },
  {
    text: "Communauté",
    items: [
      {
        text: "BlockGuard SF",
        items: [
          { text: "Serveur Discord", link: "https://discord.gg/WNKh6avffr" },
          { text: "Groupe Roblox", link: "https://www.roblox.com/communities/35439925/BlockGuard-Software-Foundation#!/about" },
          { text: "Organisation GitHub", link: "https://github.com/blockguard-sf"},
        ],
      },
      {
        text: "RbxPI",
        items: [
          { text: "Dépôt GitHub", link: "https://github.com/rbxpi/rbxpi-core"},
          { text: "Organisation GitHub", link: "https://github.com/rbxpi"},
        ],
      }
    ]
  }
])