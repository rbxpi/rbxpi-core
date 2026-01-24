---
title: Générale
createTime: 2026/01/17 22:27:56
permalink: /fr/api/internal/general
tags:
  - API
  - Internal API
---

## version

Renvoie la version actuellement utilisée de RbxPI.
La valeur retournée correspond à celle contenue dans le fichier [`version.txt`](https://github.com/rbxpi/rbxpi-core/blob/master/src/RbxPI/Version.txt), qui constitue la référence principale de la version de RbxPI.

- **Exemple:**

```luau
local RbxPI = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)

local VersionRbxPI = RbxPI.version
print(VersionRbxPI)
```

- **Retours:**

:::: field-group
::: field name="Version" type="string"
Version actuelle de RbxPI, au format: 

`[Major build].[Minor build].[Revision] - [year].[month].[day] [Development stage]`
:::

::::

## author

Renvoie l'auteur de RbxPI.

- **Exemple:**

```luau
local AuthorRbxPI = RbxPI.author
```

- **Retours:**

:::: field-group
::: field name="Auteur" type="string"
Auteur du projet RbxPI
:::

::::

## license

Renvoie le nom de la licence utilisé par RbxPI.

- **Exemple:**

```luau
local LicenseRbxPI = RbxPI.license
```

- **Retours:**

:::: field-group
::: field name="Licence" type="string"
Nom de la licence de RbxPI.
:::

::::

## copyright

Renvoie les droits d'auteurs du projet RbxPI.

- **Exemple:**

```luau
local CopyrightRbxPI = RbxPI.license
```

- **Retours:**

:::: field-group
::: field name="Droit d'auteur" type="string"
Nom de la license de RbxPI.
:::

::::

## url

Renvoie l'url du dépôt GitHub contenant le code source de RbxPI.

<RepoCard repo="rbxpi/rbxpi-core" />

- **Exemple:**

```luau
local UrlRbxPI = RbxPI.url
```

- **Retours:**

:::: field-group
::: field name="Dépôt" type="string"
Dépôt GitHub de [rbxpi-core](https://github.com/rbxpi/rbxpi-core).
:::

::::

## licenseinfo

Renvoie la licence complète de RbxPI, trouvable dans le fichier [`LICENSE`](https://github.com/rbxpi/rbxpi-core/blob/master/LICENSE) du dépôt.

- **Exemple:**

```luau
local LicenseInfoRbxPI = RbxPI.licenseinfo
```

- **Retours:**

:::: field-group
::: field name="Licence complète" type="string"
Licence complète de RbxPI.
:::

::::