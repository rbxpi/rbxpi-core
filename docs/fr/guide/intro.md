---
title: Introduction
icon: mdi:tooltip-text-outline
createTime: 2026/01/03 23:20:24
permalink: /fr/guide/intro/
tags:
  - Guide
  - Quick Start
---

::: tip Vous lisez la documentation de RbxPI!

Le support de BLuau a pris fin le 11 Mars 2025. En savoir plus sur [BLuau EOL](../bluau-eol.md).

:::

==Roblox Package Index== est un dépôt de paquets pour l'environnement de jeu et de développement Roblox en Lua. Vous pouvez **créer votre propre paquet** ou même votre **propre framework** en **respectant une structure et un format spécifiques** afin de garantir une compatibilité pour toutes les expériences utilisant RbxPI.

L'objectif de **RbxPI** est de pouvoir fournir aux développeurs une grande variété d'outils afin d'**éviter la redondance et de réinventer la roue**.

::: details Nouveau sur RbxPI?

RbxPI est apparu le 5 février 2025 sous le nom de [BLuau](https://github.com/blockguard-sf/BLuau) qui aujourd'hui n'est plus maintenu. Il est développé par [BlockGuard Software Foundation](https://github.com/blockguard-sf) (BlockGuard SF) et s'inspire très fortement de [PyPI](https://pypi.org/), un dépôt de paquets mais pour Python. Plusieurs versions non publiées ont été faites de RbxPI sous divers noms (Bluau, RoLib), mais la version la plus récente et maintenue reste RbxPI.

:::

Voici un exemple minimal:

```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI:WaitForChild("API"))

print(API.version)
```

Résultat:

```console
1.0.0 - 1.0.0 - 2025.12.23 release
```

::: info Prérequis

Le reste de la documentation suppose que vous connaissez le [Luau](https://luau.org). Cependant, même sans grande connaissances en programmation, vous pouvez utilisez RbxPI.

:::

## Pourquoi utiliser RxbPI?

RbxPI fournit une **API claire, bien documentée et facile à utiliser**, permettant à n'importe qui de gagner du temps avec des **fonctions préconstruites et optimisées** pour ainsi éviter la redondance du code en utilisant des **abstractions efficaces**.

::: warning

Pour la sécurité de nos utilisateurs seul les paquets développé et maintenu par BlockGuard SF se trouvent dans la bibliothèque standard de RbxPI.

:::

---

RbxPI est conçu pour s'**intégrer parfaitement à l'écosystème Roblox**, en évitant les conflits avec les fonctionnalités existantes. Voici quelques raison clés de l'utiliser :

- S'intègre facilement dans les projets déjà existants sans nécessiter de grosses modification.
- À une grande extensibilité grâce à sa conception modulaire.
- Compatible avec les bonnes pratiques de développement Roblox. 

---

Roblox impose des [limites de ressources](https://create.roblox.com/docs/fr-fr/performance-optimization/improve) (CPU, mémoire) aux scripts exécutés dans ses environnements. RbxPI est conçu pour pouvoir réduire sa surcharge et optimiser l'exécution de ses scripts. Il minimise son impact des opérations lourdes sur le framerate et sur la stabilité du jeu et offre une meilleur gestion des ressources grâce à ses optimisations internes.

Cela permet aux développeurs de créer des expériences plus fluides pour les joueurs sans compromettre la complexité du gameplay.