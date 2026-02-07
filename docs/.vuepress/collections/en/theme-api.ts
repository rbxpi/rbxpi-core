import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeAPI: ThemeCollectionItem = defineCollection({
    type: 'doc',
    dir: 'api',
    title: 'API',
    linkPrefix: '/api/',
    sidebar: [
        {
            text: "Internal API",
            prefix: 'internal/',
            collapsed: false,
            items: [
                'general'
            ],
        },
        {
            text: "Standard Library",
            prefix: 'stdlib/',
            collapsed: false,
            items: [
                {
                    text: 'Generic Operating System Services',
                    items : [
                        {text: 'logging', link: 'logging'},
                    ]
                }

            ]
        }
    ],
})

