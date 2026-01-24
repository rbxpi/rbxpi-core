---
title: General
createTime: 2026/01/24 14:05:30
permalink: /api/internal/general
tags:
  - API
  - Internal API
---

## version

Returns the version of RbxPI currently in use.
The returned value corresponds to the one contained in the [`version.txt`](https://github.com/rbxpi/rbxpi-core/blob/master/src/RbxPI/Version.txt) file, which serves as the primary reference for the RbxPI version.

- **Example:**

```luau
local RbxPI = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)

local VersionRbxPI = RbxPI.version
print(VersionRbxPI)
```

- **Returns:**

:::: field-group
::: field name="Version" type="string"
Current version of RbxPI, in the format:

`[Major build].[Minor build].[Revision] - [year].[month].[day] [Development stage]`
:::

::::

## author

Returns the author of RbxPI.

- **Example:**

```luau
local AuthorRbxPI = RbxPI.author
```

- **Returns:**

:::: field-group
::: field name="Auhtor" type="string"
Author of the RbxPI project
:::

::::

## license

Returns the name of the license used by RbxPI.

- **Example:**

```luau
local LicenseRbxPI = RbxPI.license
```

- **Returns:**

:::: field-group
::: field name="License" type="string"
Name of the RbxPI license.
:::

::::

## copyright

Returns the copyright of the RbxPI project.

- **Example:**

```luau
local CopyrightRbxPI = RbxPI.license
```

- **Returns:**

:::: field-group
::: field name="Copyright" type="string"
Name of the RbxPI license.
:::

::::

## url

Returns the URL of the GitHub repository containing the RbxPI source code.

<RepoCard repo="rbxpi/rbxpi-core" />

- **Example:**

```luau
local UrlRbxPI = RbxPI.url
```

- **Returns:**

:::: field-group
::: field name="Repository" type="string"
GitHub repository of [rbxpi-core](https://github.com/rbxpi/rbxpi-core).
:::

::::

## licenseinfo

Returns the full RbxPI license, found in the [`LICENSE`](https://github.com/rbxpi/rbxpi-core/blob/master/LICENSE) file of the repository.

- **Example:**

```luau
local LicenseInfoRbxPI = RbxPI.licenseinfo
```

- **Returns:**

:::: field-group
::: field name="Full License" type="string"
Full RbxPI license.
:::

::::