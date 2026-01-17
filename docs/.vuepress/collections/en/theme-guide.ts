import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeGuide: ThemeCollectionItem = defineCollection({
    type: 'doc',
    dir: 'guide',
    title: 'Guide',
    linkPrefix: '/guide/',
    sidebar: [
        {
        text: 'Getting Started',
        collapsed: false,
        icon: 'carbon:idea',
        items: [
            'intro',
            'quick-start'
        ],
        },
    ],
})