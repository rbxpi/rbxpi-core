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
            items: [
                'intro',
                'quick-start'
            ],
        },
        {
            text: 'Essentials',
            collapsed: false,
            prefix: 'essentials/',
            items: [
                'import-package',
                'package-structure'
            ],
        },
        {
            text: 'Features',
            collapsed: false,
            prefix: 'features/',
            items: [
                'autocomplete',
                'versionning'
            ],
        }
    ],
})