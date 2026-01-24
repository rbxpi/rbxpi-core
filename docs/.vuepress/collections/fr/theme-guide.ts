import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeGuide: ThemeCollectionItem = defineCollection({
    type: 'doc',
    dir: 'guide',
    title: 'Guide',
    linkPrefix: '/guide/',
    sidebar: [
        {
            text: 'Premier Pas',
            collapsed: false,
            items: [
                'intro',
                'quick-start'
            ],
        },
        {
            text: 'Essentiels',
            collapsed: false,
            prefix: 'essentials/',
            items: [
                'import-package',
                'package-structure',
            ],
        },
        {
            text: 'Fonctionnalités',
            collapsed: false,
            prefix: 'features/',
            items: [
                'autocomplete'
            ],
        },
    ],
})

