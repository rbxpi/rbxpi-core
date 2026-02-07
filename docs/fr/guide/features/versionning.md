---
title: Versionning
createTime: 2026/01/24 20:40:59
permalink: /fr/guide/features/versionning/
---

## Aperçu

Le **versionning unifié** est une fonctionnalité de base de RbxPI.
Il définit un **format unique et strict** pour représenter les versions des paquets et de leurs dépendances.

Il assure la normalisation des versions, permet une validation automatique des métadonnées et garantit une gestion fiable de compatibilité entrepaquets.
Le format retenu s'inspire des standards de l'écosystème Python tout en restant adapté à Luau et à l'environnement Roblox.

## Format de version

Chaque version est définie à l’aide d’un **tuple Luau composé de cinq éléments** :

```luau
{ MAJOR, MINOR, PATCH, TYPE, REVISION }
```

### Description des champs

| Champ | Description |
|------|------------|
| `MAJOR` | Indique une évolution majeure du paquet |
| `MINOR` | Indique une évolution mineure |
| `PATCH` | Représente un correctif ; la valeur `0` indique l’absence de correctif |
| `TYPE` | Définit le type de version (`alpha`, `beta`, `rc`, `final`) |
| `REVISION` | Numéro associé aux versions de pré-release |

::: note
Le champ `REVISION` est requis même pour les versions finales afin de garantir un format homogène et prévisible.
:::

## Utilisation

Chaque paquet RbxPI doit déclarer sa version dans ses métadonnées en respectant strictement le format défini.  
Une version mal formée entraîne l’invalidation du paquet lors de son analyse.

::: code-tabs

@tab init.luau
```luau
return {
    Name = "logging",
    Version = {2, 1, 0, "final", 0},  -- Versionning format
    Description = "Advanced Logging",
    Main = "out/index.luau",
    Author = "BlockGuard Software Foundation",
    Dependencies = {},
}
```
:::

## Configuration

À partir du tuple fourni, RbxPI génère une version normalisée sous forme de chaîne de caractères.  
Lorsque le champ `PATCH` est égal à `0`, celui-ci est omis dans la version finale.

| Tuple | Version générée |
|------|----------------|
| `{1, 0, 0, "alpha", 1}` | `1.0a1` |
| `{1, 2, 0, "beta", 3}` | `1.2b3` |
| `{1, 4, 2, "rc", 1}` | `1.4.2rc1` |
| `{2, 1, 0, "final", 0}` | `2.1` |

## Normalisation des versions

Le tuple de version n’est jamais utilisé directement par le système.  
Il est systématiquement converti en une version normalisée à l’aide du module interne de versionning, avant toute utilisation par RbxPI.

La version générée est ensuite utilisée par le système d’analyse, par la résolution des dépendances et par l’API exposée aux développeurs.

## Validation lors de l’analyse

Lors de l’analyse d’un paquet, RbxPI vérifie la structure du tuple de version, contrôle la validité du type de version et génère la version normalisée correspondante.  
Si l’une de ces étapes échoue, le paquet est rejeté même si les autres métadonnées sont correctes.

::: caution
Une version invalide entraîne l’échec complet de l’analyse du paquet.
:::

## Notes

Le versionning est obligatoire pour l’ensemble des paquets RbxPI.  
Les versions générées ne doivent jamais être modifiées manuellement.  
Ce système constitue une base essentielle pour les futures fonctionnalités liées à la gestion des dépendances et à la compatibilité entre paquets.