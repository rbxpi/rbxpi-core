import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeExamples: ThemeCollectionItem = defineCollection({
    type: 'doc',
    dir: 'examples',
    title: 'Examples',
    linkPrefix: '/examples/',
    sidebar: [
        {
            text: "Basic",
            collapsed: false,
            items: [
                'hello-world',
                'metadata',
                'license'
            ],
        }
    ],
})

