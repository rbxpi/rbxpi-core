---
title: Structure du Projet
icon: ph:tree-structure-bold
createTime: 2026/01/11 22:30:26
permalink: /fr/guide/b7e28hna/
tags:
  - Guide
  - Quick Start
---

Ce guide fournit une explication détaillée de la structure des fichiers pour les projets créés avec RbxPI, vous aidant ainsi à mieux organiser et gérer les fichiers de votre projet.

Pour les projets créés via l'outil en [ligne de commande](./usage.md#installation-en-ligne-de-commande), la structure de fichiers typique est la suivante :

::: file-tree

- .git/
- src \# Répertoire du code source
  - replicatedstorage
    - **RbxPI** \# Code source de RbxPI
      - Include/ \# Répertoire des fichiers interne de RbxPI
      - Lib \# Répertoire des paquets
        - __rhello__/
        - site-packages/
        - …
      - API.luau \# API de RbxPI
      - LICENSE.luau
      - Version.txt
    - …
  - …
- .gitignore
- aftman.toml
- default.project.json
- README.md
- selene.toml
- sourcemap.json
:::

::: tip Les projets créés manuellement peuvent également être organisés en utilisant cette structure comme référence.
:::

Le dossier `Lib` est l'endroit où vous placerez les différents paquets que vous voulez importer, ils seront directement lue par RbxPI.