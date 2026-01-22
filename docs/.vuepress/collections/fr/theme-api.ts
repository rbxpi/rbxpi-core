import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeAPI: ThemeCollectionItem = defineCollection({
    type: 'doc',
    dir: 'api',
    title: 'API',
    linkPrefix: '/api/',
    sidebar: [
        {
            text: "API Interne",
            prefix: 'internal/',
            collapsed: false,
            items: [
                'general'
            ],
        },
        {
            text: "Bibliothèque Standard",
            prefix: 'stdlib/',
            collapsed: false,
            items: []
        }
    ],
})

