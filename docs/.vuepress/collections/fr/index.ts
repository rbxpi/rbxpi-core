import { defineCollections, type ThemeCollections } from 'vuepress-theme-plume'
import { themeGuide } from './theme-guide.js'
import { themeAPI } from './theme-api.js'
import { themeExamples } from './theme-examples.js'
import { themeReleases } from './theme-releases.js'

export const frCollections: ThemeCollections = defineCollections([
    themeGuide,
    themeAPI,
    themeExamples, 
    themeReleases
])