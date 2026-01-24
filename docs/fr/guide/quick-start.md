---
title: Démarrage Rapide
createTime: 2026/01/04 21:10:06
permalink: /fr/guide/installation/
tags:
  - Guide
  - Quick Start
---

::: important Exigence de l'environnement

- Familiarité avec votre propre environnement de développement
- Installer [Roblox Studio](https://create.roblox.com/docs/fr-fr/tutorials/curriculums/studio/install-studio)
:::

Il existe différente façons d'installer RbxPI en fonction de votre environnement de développement.

## Installer via Roblox Studio <Badge type="tip" text="Recommandé pour les débutants" />

Si vous utilisez simplement [Roblox Studio](https://create.roblox.com/docs/fr-fr), vous pouvez installer le modèle depuis le [marché des créateurs](https://create.roblox.com/store/asset/72160239405840/RbxPI-Roblox-Package-Index) sur Roblox directement. Cela permet d'installer RbxPI de la façon la plus simple et sécurisé possible.

::: note

Le modèle Roblox n'ajoute rien à RbxPI. Il est néanmoins déconseillé de modifier cette version.

Si vous souhaitez créer un [fork de RbxPI](https://github.com/rbxpi/rbxpi-core/fork), il est préférable de le faire via [Rojo](https://rojo.space/) pour permettre un meilleur versionning.

:::

## Installer via Rojo & Github

::: warning

Cette solution n'est pas compatible pour les systèmes d'exploitation qui ne sont pas prévu par Roblox. Si vous voulez savoir si votre machine est compatible veuillez vous référer à la [documentation de Roblox](https://create.roblox.com/docs/fr-fr/tutorials/curriculums/studio/install-studio).

:::
 
Si vous voulez installer RbxPI ailleur que sur Roblox Studio vous devez tout d'abord avoir installé ces prérequis:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Rojo v7](https://rojo.space/docs/v7/getting-started/installation/) ou une version supérieur.
- Une [implémentation d'un serveur de langage](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp) pour le langage de programmation [Luau](https://github.com/Roblox/luau).
- La dernière version de [Git](https://git-scm.com)

### Installation en Ligne de Commande <Badge type="tip" text="Recommandé" />

Actuellement non-disponible.

### Installation Manuelle

::: warning

Cette solution part du principe que vous avez déjà installé et configuré les outils qui vous ont était demandé dans votre projet.

:::

Si vous voulez installer RbxPI manuellement veuillez suivrez ces étapes:

:::: steps

- #### Créer le Répertoire de RbxPI

  ```sh
  cd répertoire/de/votre/projet/
  mkdir nom-du-dossier-replicatedstorage
  ```

- #### Cloner le Dépôt

  ```sh
  git clone https://github.com/rbxpi/rbxpi-core
  ```

- #### Déplacer le Dossier Source de RbxPI

  ```sh
  cd rbxpi-core/src/
  cp RbxPI/ /répertoire/où/se/trouve/le/dossier/replicatedstorage/
  ```

- #### Supprimer le Dépot

  ```sh
  cd répertoire/de/votre/projet/
  rmdir ./rbxpi-core/
  ```


- #### Configurer le Script de Compilation

  Ajoutez les éléments suivants à `default.project.json` dans l'élément `"tree"`:

  ```sh
  "ReplicatedStorage": {
    "$path": "répertoire/vers/le/dossier/replicatedstorage"
  }
  ```

- #### Lancer le Développement

  ```sh
  rojo serve
  ```
  
  ::: warning

  Si un message d'erreur est affiché veuillez regénérer votre `sourcemap.json`

  :::

- #### Installation Terminé

::::

## Structure du Répertoire

Pour les projets créés via l'outil en [ligne de commande](#installation-en-ligne-de-commande), la structure de fichiers typique est la suivante :

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

## En Savoir Plus sur RbxPI

Maintenant que vous disposez d'un dépôt de paquet fonctionnel vous devriez consulter le guide suivant pour en savoir plus sur RbxPI et savoir comment [importer un paquet](./essentials/import-package.md).