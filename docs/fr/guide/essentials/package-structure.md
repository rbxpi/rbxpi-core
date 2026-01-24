---
title: Structure d'un Paquet
createTime: 2026/01/23 19:47:47
permalink: /fr/guide/essentials/package-structure
---

Cette page décrit **la structure officielle d'un paquet.** Elle explique quels fichiers sont obligatoires, lesquels sont recommandés, et comment organiser correctement votre code afin que votre paquet soit valide, maintenable et accepté dans l'index RbxPI.

## C'est quoi un Paquet?

Un paquet est un dossier contenant du code Luau destiné à être utilisé dans des projets Roblox via RbxPI.

Chaque paquet :
- possède une structure standardisée
- expose une API publique claire
- peut déclarer des dépendances
- est versionné

::: important

RbxPI valide la structure des paquets. 
Une structure incorrecte rend le paquet **invalide**.

:::

## Structure Minimal <Badge type="tip" text="Obligatoire" />

Tout paquet doit respecter au minimum cette structure :

::: file-tree

- monpaquet
    - Out
        - Index.luau
        - …
    - init.luau
    - LICENSE.luau
:::

Sans ces éléments le paquet ne peut ni être indexé ni utilisé.

## Fichiers Obligatoires

Pour qu’un paquet soit compatible avec RbxPI et conforme au format requis, plusieurs fichiers spécifiques doivent être présents au sein du paquet.

::: warning

Si un paquet ne contient pas l’un des fichiers requis, il ne pourra pas être chargé.

:::

### `init.luau`

Le fichier `init.luau` est le fichier le plus important du paquet : il contient l’ensemble des métadonnées du paquet.
RbxpI l'utilise pour identifier le paquet, gérer sa version et récupérer les dépendances nécessaire.
Il ne doit donc en aucun cas être modifié.

::: note

Toute dépendance utilisée dans le code doit être déclarée dans `init.luau`.

Le nom du paquet indiqué dans les métadonnées doit correspondre au nom du fichier principale du paquet.
:::

Vous pouvez retrouver un exemple [ici](/fr/examples/metadata.md).

### `License.luau`

Le fichier LICENSE définit les conditions du paquet.
Même si votre dépôt est public, une licence explicite est nécessaire.
Elle est utilisé par le fichier [`init.luau`](#initluau) pour contenir la licence du paquet.
De se fait, elle doit respecter un format très précis et ne doit pas être déplacé.

Vous pouvez retrouver un exemple [ici](/fr/examples/license.md)

### `Out/Index.luau`

`Index.luau` est le **point d'entrée du paquet.**
C'est le fichier qui expose l'API publique du paquet contenu par la variable qui est renvoyé.

::: important

Les utilisateurs interagisent **uniquement** avec ce que vous exposez depuis `init.luau`

:::

Vous pouvez retrouver un exemple [ici](/fr/examples/hello-world.md)
