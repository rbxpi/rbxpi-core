---
title: Introduction
createTime: 2026/01/03 23:20:24
permalink: /guide/intro/
tags:
  - Guide
  - Quick Start
---

::: tip You are reading the RbxPI documentation!

Support for BLuau ended on March 11, 2025. Learn more about [BLuau EOL](../bluau-eol.md).

:::

**Roblox Package Index** is a package repository for the Roblox game and development environment in Lua. You can **create your own package** or even your **own framework** by **following a [specific structure and format](./essentials/package-structure.md)** to ensure compatibility across all experiences using RbxPI.

The goal of **RbxPI** is to provide developers with a wide variety of tools in order to **avoid redundancy and reinventing the wheel**.

::: details New to RbxPI?

RbxPI first appeared on February 5, 2025 under the name [BLuau](https://github.com/blockguard-sf/BLuau), which is no longer maintained today. It is developed by [BlockGuard Software Foundation](https://github.com/blockguard-sf) (BlockGuard SF) and is heavily inspired by [PyPI](https://pypi.org/), a package repository for Python. Several unpublished versions of RbxPI were created under various names (Bluau, RoLib), but the most recent and maintained version remains RbxPI.

:::

Here is a minimal example:

```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI:WaitForChild("API"))

print(API.version)
```

Result:

```console
1.0.0 - 1.0.0 - 2025.12.23 release
```

::: info Prerequisites

The rest of the documentation assumes that you are familiar with [Luau](https://luau.org). However, even without strong programming knowledge, you can use RbxPI.

:::

## Pourquoi utiliser RxbPI?

RbxPI provides a **clear, well-documented, and easy-to-use API**, allowing anyone to save time with **prebuilt and optimized functions**, thereby avoiding code redundancy through the use of **efficient abstractions**.

::: warning

For the safety of our users, only packages developed and maintained by BlockGuard SF are included in the RbxPI [standard library](../api/intro.md#standard-library).

:::

---

RbxPI is designed to **integrate seamlessly with the Roblox ecosystem**, avoiding conflicts with existing features. Here are some key reasons to use it:

- Easily integrates into existing projects without requiring major modifications.
- Highly extensible thanks to its modular design.
- Compatible with Roblox development best practices. 

---

Roblox imposes [resource limits](https://create.roblox.com/docs/fr-fr/performance-optimization/improve) (CPU, memory) on scripts running in its environments. RbxPI is designed to reduce overhead and optimize script execution. It minimizes the impact of heavy operations on the framerate and game stability, and provides better resource management thanks to its internal optimizations.

This allows developers to create smoother experiences for players without compromising gameplay complexity.
