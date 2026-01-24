import { defineCollections, type ThemeCollections } from 'vuepress-theme-plume'
import { themeGuide } from './theme-guide.js'
import { themeExamples } from './theme-examples.js'
import { themeReleases } from './theme-releases.js'
import { themeAPI } from './theme-api.js'

export const enCollections: ThemeCollections = defineCollections([
    themeGuide,
    themeExamples,
    themeReleases,
    themeAPI
])