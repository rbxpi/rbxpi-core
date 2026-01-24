import type { ThemeCollectionItem } from 'vuepress-theme-plume'
import { defineCollection } from 'vuepress-theme-plume'

export const themeReleases: ThemeCollectionItem = defineCollection({
    type: 'post',
    dir: 'about/releases',
    title: 'Releases',
    linkPrefix: '/about/releases/',
    postList: true,
    tags: true,
    autoFrontmatter: {
        createTime: true,
    },
    
    social: [
        { icon: 'github', link: 'https://github.com/blocguard-sf' },
        { icon: 'discord', link: 'https://discord.gg/WNKh6avffr' },
    ],
})