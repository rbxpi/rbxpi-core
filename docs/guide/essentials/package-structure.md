---
title: Package Structure
createTime: 2026/01/24 13:05:03
permalink: /guide/essentials/package-structure/
---

This page describes **the official structure of a package.** It explains which files are mandatory, which are recommended, and how to correctly organize your code so that your package is valid, maintainable, and accepted into the RbxPI index.

## What is a Package?

A package is a folder containing Luau code intended for use in Roblox projects via RbxPI.

Each package:

- has a standardized structure
- exposes a clear public API
- can declare dependencies
- is versioned

::: important

RbxPI validates package structure.
An incorrect structure makes the package **invalid**.

:::

## Minimal Structure <Badge type="tip" text="Mandatory" />

Every package must, at a minimum, respect the following structure:

::: file-tree

- mypackage
    - Out
        - Index.luau
        - …
    - init.luau
    - LICENSE.luau
:::

Without these elements, the package can neither be indexed nor used.

## Mandatory Files

For a package to be compatible with RbxPI and comply with the required format, several specific files must be present within the package.

::: warning

If a package is missing any of the required files, it will not be able to be loaded.

:::

### `init.luau`

The `init.luau` file is the most important file in the package: it contains all of the package's metadata.
RbxPI uses it to identify the package, manage its version, and retrieve the necessary dependencies.
It must therefore not be modified under any circumstances.

::: note

Any dependency used in the code must be declared in `init.luau`.

The package name indicated in the metadata must match the name of the main package file.
:::

You can find an example [here](/examples/metadata.md).

### `License.luau`

The LICENSE file defines the package's conditions.
Even if your repository is public, an explicit license is required.
It is used by the [`init.luau`](#initluau) file to contain the package license.
Therefore, it must follow a very specific format and must not be moved.

You can find an example [here](/examples/license.md)

### `Out/Index.luau`

`Index.luau` is the **package entry point.**
It is the file that exposes the package's public API through the returned variable.

::: important

Users interact **only** with what you expose from `init.luau`

:::

You can find an example [here](/examples/hello-world.md)
