---
title: Importer un Paquet
createTime: 2026/01/18 16:38:15
permalink: /fr/guide/essentials/import-package/
---

L'importation d'un paquet dans votre code s'effectue en deux étapes principales:
- Importer l’API de RbxPI dans le script cible.
- Importer le paquet souhaité à l’aide de cette API.

## Importation de l'API

Le mécanisme d’importation de l’API de RbxPI a été pensé afin d’être simple, intuitif et accessible à tous les développeurs.
Il permet une prise en main rapide, quel que soit le niveau d’expérience.

```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)
```

::: details Importation en une seule ligne

Afin de limiter l’encombrement du code, il est possible d’utiliser une forme d’importation plus compacte, comme illustré ci-dessous :

```luau
local API = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)
```

::: warning

Une réduction excessive du code peut nuire à l’optimisation et à la fiabilité.
La méthode présentée ci-dessus constitue l’approche la plus fiable.

:::

## Importation d'un Paquet

Pour importer un paquet directement dans votre script, il suffit d’appeler la variable interagissant avec l’API dans votre code et de spécifier le nom du paquet souhaité.

```luau
local VersionRbxPI = API.version
print(VersionRbxPI)
```

## Structure du Code

::: tabs
@tab Rojo & GitHub

Si vous avez installé RbxPI via [Rojo & GitHub](quick-start.md#installer-via-rojo-github), vous devez obtenir une structure similaire à la suivante:

::: code-tree title="RbxPI" height="400px" entry="src/ServerScriptService/script.server.luau"
```luau title="src/ReplicatedStorage/RbxPI/API.luau"
-- Contenu de l'API de RbxPI
```

```luau title="src/ServerScriptService/script.server.luau"
-- Importation de l'API de RbxPI 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)

-- Importation du Paquet 
local VersionRbxPI = API.version
print(VersionRbxPI)

```

```luau title="src/ServerScriptService/script2.server.luau"
-- Importation de l'API de RbxPI en une seule ligne
local RbxPI = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)

-- Importation du Paquet 
local VersionRbxPI = RbxPI.version
print(VersionRbxPI)
```

```json title="default.project.json"
{
    "name": "your-project-name",
    "tree": {
        "$className": "DataModel",
    
        "ReplicatedStorage": {
            "$className": "ReplicatedStorage",
            "$path": "src/ReplicatedStorage/"
        },

        "ServerScriptService": {
            "$className": "ServerScriptService",
            "$path": "src/ServerScriptService/"
        }
    }
}
```

@tab Roblox Studio

Si vous avez installé RbxPI via [Roblox Studio](quick-start.md#installer-via-roblox-studio), vous devriez obtenir une structure légèrement plus légère :

::: code-tree title="RbxPI" height="400px" entry="ServerScriptService/script"
```luau title="ReplicatedStorage/RbxPI/API"
-- Contenu de l'API de RbxPI
```

```luau title="ServerScriptService/script"
-- Importation de l'API de RbxPI 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)

-- Importation du Paquet 
local VersionRbxPI = API.version
print(VersionRbxPI)

```

```luau title="ServerScriptService/script2"
-- Importation de l'API de RbxPI en une seule ligne
local RbxPI = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)

-- Importation du Paquet 
local VersionRbxPI = RbxPI.version
print(VersionRbxPI)
```

:::
