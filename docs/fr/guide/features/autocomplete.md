---
title: Auto-Complétion
createTime: 2026/01/19 19:08:43
permalink: /fr/guide/features/autocomplete/
---

## Aperçu

L’auto-complétion est une fonctionnalité clé de RbxPI.
Sans celle-ci, vous seriez contraint de parcourir chaque paquet afin de rechercher les fonctions susceptibles de vous être utiles.
Grâce à l’auto-complétion, chaque paquet, fonction et variable est répertorié, ce qui permet un gain de temps considérable.

::: warning

Seuls les paquets présents dans la [bibliothèque standard](/fr/api/intro#bibliotheque-standard) de RbxPI sont répertoriés dans l’API et peuvent, par conséquent, bénéficier de l’auto-complétion.

:::

## Utilisation

Pour bénéficier de l’auto-complétion, il suffit d’[importer l’API](/fr/guide/essentials/import-package/#importation-de-l-api) de RbxPI dans votre code.
Cette fonctionnalité est disponible quel que soit le mode d’installation utilisé.

::: note Cette fonctionnalité fonctionne aussi bien côté serveur que côté client.
:::


::: code-tabs

@tab script.server.luau
```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)
```

:::

Après avoir importé l’API, il vous suffit de l’appeler afin de bénéficier de l’auto-complétion.

::: code-tabs

@tab script.server.luau
```luau
local versionInfo = API.version
```

:::

## Configuration

::: warning

Cette API n’est pas représentative de l’API réelle de RbxPI ; elle est fournie uniquement à titre d’exemple.

:::

::: code-tabs

@tab ReplicatedStorage/RbxPI/API.luau
```luau
local API = {}:: {
    --[[
    Ce format indique l’exportation d’une variable

    `version` est le nom de la variable
    `string` indique le type de la valeur

    API.version
    ]]
    version: string,
    --[[
    Exportation d'un paquet

    API.__rhello__
    ]]
    __rhello__: {
        --[[
        Ce format indique l'exportation d'une fonction contenant des arguments 
        mais en ne renvoyant aucune valeur

        `helloworld` : nom de la fonction
        `message: string` : argument en string attendu
        `nil` : valeur retourné

        API.__rhello__.helloworld("Hello World!")
        ]]
        helloworld: (message: string) -> nil,

        --[[
        Ce format indique l'exportation d'une fonction sans attendre d'argument 
        mais en renvoyant une valeur

        `eggs` : nom de la fonction
        `()` : argument en string attendu, ici aucun
        `string` : valeur retourné

        local contenu = API.__rhello__.eggs()
        ]]
        eggs: () -> { string },
    }
}
```
:::

## Notes

Si vous utilisez des paquets ne faisant pas partie de la bibliothèque standard de RbxPI, vous pouvez étendre votre API en y exposant les fonctions et variables définies par leurs créateurs.

::: caution

Si un paquet requiert davantage qu’une simple extension de l’API, notamment via la modification du code, la suppression de fichiers ou toute autre action intrusive, il est fortement déconseillé de procéder à son installation.

:::