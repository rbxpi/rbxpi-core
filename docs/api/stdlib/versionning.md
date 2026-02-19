---
title: versionning - Semantic Version
createTime: 2026/02/19 22:24:56
permalink: /api/stdlib/versionning
---

---

A package that provides a tool for segmenting version metadata

---

## Table of Contents

### Methods

:::table full-width

|                                                                                                              |
| ------------------------------------------------------------------------------------------------------------ |
| [getVersion](#getVersion) (version: { major : number, minor : number, patch : number, type : string, build : number? }) : string |
|                                                                                                         |
:::  

This module provides a **simple and structured version management system** for Luau packages. It allows defining a version as a tuple `{major, minor, patch, type, build}` and converting it into a normalized string representation (e.g., `"1.2.3a4"`).

The module automatically validates the structure and type of the version (`alpha`, `beta`, `rc`, `final`) to ensure consistency across the project. It separates the main version (`X.Y` or `X.Y.Z`) from pre-release suffixes and applies a standard abbreviated convention (`a`, `b`, `rc`).

This system standardizes versioning across all modules, facilitating dependency management, release tracking, and integration with the loader or packaging tools.

## Methods

#### getVersion

Returns the formatted version from a structured tuple.

```luau
versionning.getVersion(
    version: {
        major : number, minor : number, patch : number, type : string, build : number?
    }
) : string
```

**Parameters**

:::: field-group

::: field name="version" type="tuple"

:::: field-group

::: field name="major" type="number"
Indicates a major step.

::: field name="minor" type="number"
Used for feature updates, significant bug fixes, etc.

::: field name="patch" type="number"
Minor modifications to existing features, small bug fixes, etc.

::: field name="type" type="string"
Indicates the current stage of the project (alpha, beta, rc, final)

::: field name="build" type="number?" optional
Code remains the same; changes in external libraries or asset updates.
:::

::::

**Returns**

:::: field-group

::: field type="string"
String containing the formatted version.
:::

::::

The `getVersion` function generates a normalized textual representation of a version from a structured tuple `{major, minor, patch, type, build}`. It ensures the version follows a strict format before any transformation by validating the number of elements and the type (`alpha`, `beta`, `rc`, `final`). This prevents inconsistencies in the project’s versioning system.

The function first constructs the main version in the form `X.Y` or `X.Y.Z`, automatically omitting the patch number when it equals `0`. It then appends a suffix for pre-release versions (`a`, `b`, `rc`) followed by the build number, clearly distinguishing unstable versions from final releases.

If the type is `final`, no suffix is added, producing a clean stable version (e.g., `1.2` or `1.2.3`). This behavior ensures a clear separation between development versions and production-ready releases.

By centralizing this formatting and validation logic, `getVersion` guarantees uniformity of version numbers across all modules, facilitating maintenance, version comparison, and release management within the project environment.

