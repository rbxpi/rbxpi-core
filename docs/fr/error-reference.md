---
title: Référence des Codes d’Erreur
createTime: 2026/01/17 22:41:06
permalink: /fr/error-reference
tags:  
    - Error
---

Ce manuel recense les erreurs susceptibles d’être rencontrées lors de l’utilisation de RbxPI. Chaque erreur est associée à un code, facilitant ainsi leur identification et leur référencement.

La gestion de ces erreurs est assurée par le fichier [`ErrorHandler.luau`](https://github.com/rbxpi/rbxpi-core/blob/master/src/RbxPI/Include/ErrorHandler.luau), situé dans le dossier `include/`, aux côtés du Bootstrap.

::: info

Les codes ne comportant ni dizaine ni unité ne correspondent pas à des erreurs spécifiques, mais à des catégories regroupant l’ensemble des codes appartenant à une même centaine.
Exemple : `000`, `100`, `200`, …

:::

## Erreurs d'exécution

Les erreurs d’exécution sont généralement liées à l’API et au `Bootstrap` de RbxPI.
Leurs codes d’erreur se situent dans la plage `001` et `199`.

Le tableau suivant établit une correspondance entre les codes et leurs chaînes d'information complètes d'origine.

| Code | Message `001`-`099` API |
| -------- | -------- |
| 001 | Le paquet demandé n’est pas répertorié dans l’API de RbxPI. |
| 002 | Une erreur est survenue durant l’initialisation du bootstrap. |

| Code | Message `101`-`199` Bootstrap |
| -------- | -------- |
| 101 | Le paquet demandé est introuvable dans le chargeur. |
| 102 | Le bootstrap a déjà été initialisé. |

## Erreurs de chargement

Les erreurs de chargement sont étroitement liées au processus de chargement des paquets.
Leurs codes d'erreur se situent dans la plage `201` et `599`.

Le tableau suivant établit une correspondance entre les codes et leurs chaînes d'information complètes d'origine.

| Code | Message `201`-`299` Scanneur|
| -------- | -------- |
| 201 | Le paquet demandé existe déjà dans le registre. |

| Code | Message `301`-`399` Validateur|
| -------- | -------- |
| 301 | Les métadonnées du paquet demandé sont invalides ou manquantes. |
| 302 | Un élément requis est absent des métadonnées du paquet demandé. |
| 303 | Le format de la licence spécifiée dans les métadonnées du paquet demandé est invalide. |
| 304 | Le chemin vers le répertoire du fichier principal du paquet est invalide. |
| 305 | Le chargement des métadonnées du paquet demandé a échoué. |
| 306 | Incohérence entre le nom du paquet demandé et celui spécifié dans ses métadonnées. |
| 307 | Le format des dépendances du paquet demandé est invalide. |


| Code | Message `401`-`499` Dépendances|
| -------- | -------- |
| 401 | Une ou plusieurs dépendances du paquet sont invalides ou absentes. |

| Code | Message `501`-`599` Chargeur|
| -------- | -------- |
| 501 | Échec du chargement du paquet demandé. |


