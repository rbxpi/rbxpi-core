import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeGuide: ThemeCollectionItem = defineCollection({
    type: 'doc',
    dir: 'demo',
    title: 'Demo',
    sidebar: ['', 'foo', 'bar'],
})