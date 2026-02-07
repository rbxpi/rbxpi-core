---
title: Versionning
createTime: 2026/02/07 14:47:33
permalink: /guide/features/versionning
---

## Overview

**Unified versioning** is a core feature of RbxPI.  
It defines a **single, strict format** for representing package versions and their dependencies.

It ensures version normalization, enables automatic metadata validation, and guarantees reliable compatibility management between packages.  
The chosen format is inspired by standards from the Python ecosystem while remaining adapted to Luau and the Roblox environment.

## Version format

Each version is defined using a **Luau tuple composed of five elements**:

```luau
{ MAJOR, MINOR, PATCH, TYPE, REVISION }
```

### Field description

| Field      | Description                                               |
| ---------- | --------------------------------------------------------- |
| `MAJOR`    | Indicates a major evolution of the package                |
| `MINOR`    | Indicates a minor evolution                               |
| `PATCH`    | Represents a bug fix; the value `0` indicates no patch    |
| `TYPE`     | Defines the release type (`alpha`, `beta`, `rc`, `final`) |
| `REVISION` | Number associated with pre-release versions               |

::: note
The `REVISION` field is required even for final releases in order to guarantee a consistent and predictable format.
:::

## Usage

Each RbxPI package must declare its version in its metadata while strictly respecting the defined format.
An incorrectly formatted version results in the package being invalidated during analysis.

::: code-tabs

@tab init.luau

```luau
return {
    Name = "logging",
    Version = {2, 1, 0, "final", 0},  -- Versioning format
    Description = "Advanced Logging",
    Main = "out/index.luau",
    Author = "BlockGuard Software Foundation",
    Dependencies = {},
}
```

:::

## Configuration

Based on the provided tuple, RbxPI generates a normalized version as a string.
When the `PATCH` field is equal to `0`, it is omitted from the final version.

| Tuple                   | Generated version |
| ----------------------- | ----------------- |
| `{1, 0, 0, "alpha", 1}` | `1.0a1`           |
| `{1, 2, 0, "beta", 3}`  | `1.2b3`           |
| `{1, 4, 2, "rc", 1}`    | `1.4.2rc1`        |
| `{2, 1, 0, "final", 0}` | `2.1`             |

## Version normalization

The version tuple is never used directly by the system.
It is systematically converted into a normalized version through the internal versioning module before any use by RbxPI.

The generated version is then used by the analysis system, dependency resolution, and the API exposed to developers.

## Validation during analysis

During package analysis, RbxPI validates the structure of the version tuple, checks the validity of the release type, and generates the corresponding normalized version.
If any of these steps fail, the package is rejected even if the other metadata are correct.

::: caution
An invalid version results in a complete failure of the package analysis.
:::

## Notes

Versioning is mandatory for all RbxPI packages.
Generated versions must never be modified manually.
This system provides an essential foundation for future features related to dependency management and package compatibility.
