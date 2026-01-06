import { defineCollection, defineCollections } from 'vuepress-theme-plume'

/* =================== locale: en-US ======================= */


const enDemoDoc = defineCollection({
  type: 'doc',
  dir: 'demo',
  title: 'Demo',
  sidebar: ['', 'foo', 'bar'],
})

export const enCollections = defineCollections([
  enDemoDoc,
])


const frGuideDoc = defineCollection({
  type: 'doc',
  dir: 'guide',
  title: 'Guide',
  linkPrefix: '/guide/',
  sidebar: [
    {
      text: 'Premier Pas',
      collapsed: false,
      icon: 'carbon:idea',
      items: [
        'intro',
        'usage',
      ],
    },
  ],
})

export const frCollections = defineCollections([
  frGuideDoc,
])