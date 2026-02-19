---
title: versionning - Version Sémantique
createTime: 2026/02/19 21:58:23
permalink: /fr/api/stdlib/versionning
---


Un paquet qui définit un outil de ségmentigation de métadonnées de version

---

## Sommaire

### Méthodes

:::table full-width
||
| -- |
| [getVersion](#getVersion) (version: { major : number, minor : number, patch : number, type : string, build : number? }) : string |
:::

Ce module fournit un **système simple et structuré de gestion de version** pour les packages Luau. Il permet de définir une version sous forme de tuple `{major, minor, patch, type, build}` puis de la convertir en représentation normalisée sous forme de chaîne (ex. `"1.2.3a4"`).

Le module valide automatiquement la structure et le type de version (`alpha`, `beta`, `rc`, `final`) afin de garantir la cohérence des numéros utilisés dans le projet. Il sépare la version principale (`X.Y` ou `X.Y.Z`) des suffixes de pré-release et applique une convention abrégée standard (`a`, `b`, `rc`).

Ce système permet d’uniformiser le versionning à travers l’ensemble des modules, facilitant la gestion des dépendances, le suivi des releases et l’intégration avec le loader ou les outils de packaging.

## Méthodes

#### getVersion

Retourne la version formatée à partir d’un tuple structuré.

```luau
versionning.getVersion(
    version: {
        major : number, minor : number, patch : number, type : string, build : number?
    }
) : string
```

**Paramètres**

:::: field-group

::: field name="version" type="tuple"

:::: field-group

::: field name="major" type="number" 
Indique une étape importante.

::: field name="minor" type="number" 
Utilisé pour les mises à jour de fonctionnalités, les corrections de bugs important, etc.

::: field name="patch" type="number"
Modification mineurs sur les fonctionnalités existantes, petites corrections de bugs, etc.

::: field name="type" type="string"
Indique l'étape actuelle du jeu (alpha, beta, rc, final)

::: field name="build" type="number?" optional
Le code reste le même, modifications de la bibliothèque externe ou mise à jour des fichiers d'assets.
:::

::::

**Retours**

:::: field-group

::: field type="string"
String contenant la version formaté.
:::

::::

La fonction `getVersion` génère une représentation textuelle normalisée d’une version à partir d’un tuple structuré `{major, minor, patch, type, build}`. Elle garantit que la version respecte un format strict avant toute transformation, en validant le nombre d’éléments et la nature du type (`alpha`, `beta`, `rc`, `final`). Cette vérification permet d’éviter toute incohérence dans le système de versionning du projet.

La fonction construit d’abord la version principale sous la forme `X.Y` ou `X.Y.Z`, en omettant automatiquement le numéro de patch lorsque celui-ci est égal à `0`. Elle ajoute ensuite un suffixe pour les versions de pré-release (`a`, `b`, `rc`) suivi du numéro de build, ce qui permet de distinguer clairement les versions instables des versions finales.

Si le type est `final`, aucun suffixe n’est ajouté, produisant une version stable propre (par exemple `1.2` ou `1.2.3`). Ce comportement assure une distinction claire entre les versions de développement et les versions prêtes pour la production.

En centralisant cette logique de formatage et de validation, `getVersion` garantit une uniformité des numéros de version à travers l’ensemble des modules, facilitant la maintenance, la comparaison des versions et la gestion des releases dans l’environnement du projet.

*[string]: Une séquence de caractères, tels que des lettres, des chiffres et des symboles.
*[boolean]: Type de données ayant une valeur de vrai ou faux.
*[number]: Un nombre à virgule flottante double précision.
*[nil]: N'importe quel type