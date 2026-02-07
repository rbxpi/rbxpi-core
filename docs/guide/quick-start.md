---
title: Quick Start
createTime: 2026/01/24 12:37:25
permalink: /guide/quick-start/
tags:
  - Guide
  - Quick Start
---

::: important Environment Requirements

- Familiarity with your own development environment
- Install [Roblox Studio](https://create.roblox.com/docs/fr-fr/tutorials/curriculums/studio/install-studio)
:::

There are different ways to install RbxPI depending on your development environment.

## Roblox Install Manager <Badge type="tip" text="Recommandé" />

The **Roblox Install Manager** is a program that allows you to install and update RbxPI as easily as possible.

<RepoCard repo="rbxpi/rbxmanager" />

::: note It is impossible to update RbxPI if your installation was not done via [Rojo](https://rojo.space/).
:::

To install rbxManager, please follow these steps:

:::: steps

- #### Clone the Git repository of rbxmanager
  ```sh
  git clone https://github.com/rbxpi/rbxmanager
  ```

- #### Go to the RbxManager directory.
  ```sh
  cd rbxmanager
  ```

- #### Install the required dependencies
  ```sh
  pip install -r requirements.txt
  ```

- #### Run the program
  ```sh
  python3 rbxmanager
  ```

- #### Follow the rbxmanager installation steps
::::

## Install via Roblox Studio <Badge type="tip" text="Recommended for beginners" />

If you are simply using [Roblox Studio](https://create.roblox.com/docs/fr-fr), you can install the model directly from the [Creator Marketplace](https://create.roblox.com/store/asset/72160239405840/RbxPI-Roblox-Package-Index) on Roblox. This allows you to install RbxPI in the simplest and most secure way possible.

::: note

The Roblox model does not add anything to RbxPI. However, modifying this version is not recommended.

If you want to create a [fork of RbxPI](https://github.com/rbxpi/rbxpi-core/fork), it is preferable to do so via [Rojo](https://rojo.space/) to allow for better versioning.

:::

## Install via Rojo & GitHub

::: warning

This solution is not compatible with operating systems that are not supported by Roblox. If you want to know whether your machine is compatible, please refer to the [Roblox documentation](https://create.roblox.com/docs/fr-fr/tutorials/curriculums/studio/install-studio).

:::
 
If you want to install RbxPI anywhere other than Roblox Studio, you must first have the following prerequisites installed:

* [Visual Studio Code](https://code.visualstudio.com/)
* [Rojo v7](https://rojo.space/docs/v7/getting-started/installation/) or a later version
* An [implementation of a language server](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp) for the [Luau](https://github.com/Roblox/luau) programming language
* The latest version of [Git](https://git-scm.com)

### Manual Installation

::: warning

This solution assumes that you have already installed and configured the tools that were required for your project.

:::

If you want to install RbxPI manually, please follow these steps:

:::: steps

- #### Create the RbxPI Directory

  ```sh
  cd path/to/your/project/
  mkdir replicatedstorage-folder-name
  ```

- #### Clone the Repository

  ```sh
  git clone https://github.com/rbxpi/rbxpi-core
  ```

- #### Move the RbxPI Source Folder

  ```sh
  cd rbxpi-core/src/
  cp RbxPI/ /path/to/your/replicatedstorage/folder/
  ```

- #### Delete the Repository

  ```sh
  cd path/to/your/project/
  rmdir ./rbxpi-core/
  ```


- #### Configure the Build Script

  Add the following elements to `default.project.json` in the `"tree"` element:

  ```sh
  "ReplicatedStorage": {
    "$path": "path/to/the/replicatedstorage/folder"
  }
  ```

- #### Launch Development

  ```sh
  rojo serve
  ```
  
  ::: warning

  If an error message is displayed, please regenerate your `sourcemap.json`

  :::

- #### Installation Complete

::::

## Directory Structure

For projects created via [rbxmanager](#roblox-install-manager) tool, the typical file structure is as follows:

::: file-tree

- .git/
- src \# Source code directory
  - replicatedstorage
    - **RbxPI** \# RbxPI source code
      - Include/ \# RbxPI internal files directory
      - Lib \# Packages directory
        - __rhello__/
        - site-packages/
        - …
      - API.luau \# RbxPI API
      - LICENSE.luau
      - Version.txt
    - …
  - …
- .gitignore
- aftman.toml
- default.project.json
- README.md
- selene.toml
- sourcemap.json
:::

::: tip Manually created projects can also be organized using this structure as a reference.
:::

The `Lib` folder is where you will place the various packages you want to import; they will be read directly by RbxPI.

## En Savoir Plus sur RbxPI

Now that you have a functional package repository, you should consult the following guide to learn more about RbxPI and find out how to [import a package](./essentials/import-package.md).