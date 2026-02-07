---
title: Error Code Reference
createTime: 2026/01/17 22:41:06
permalink: /error-reference
tags:  
    - Error
---

This manual lists the errors that may be encountered while using RbxPI. Each error is associated with a code, facilitating their identification and referencing.

The management of these errors is handled by the [`ErrorHandler.luau`](https://github.com/rbxpi/rbxpi-core/blob/master/src/RbxPI/Include/ErrorHandler.luau) file, located in the `include/` folder, alongside the Bootstrap.

::: info

Codes containing neither tens nor units do not correspond to specific errors, but to categories grouping all codes belonging to the same hundred.
Example: `000`, `100`, `200`, …

:::

## Runtime Errors

Runtime errors are generally related to the RbxPI API and `Bootstrap`.
Their error codes range from `001` to `199`.

The following table establishes a correspondence between the codes and their original complete information strings.

| Code | API Message `001`-`099` |
| -------- | -------- |
| 001 | The requested package is not listed in the RbxPI API. |
| 002 | An error occurred during the bootstrap initialization. |

| Code | Bootstrap Message `101`-`199` |
| -------- | -------- |
| 101 | The requested package could not be found in the loader. |
| 102 | The bootstrap has already been initialized. |

## Loading Errors

Loading errors are closely related to the package loading process.
Their error codes range from `201` to `599`.

The following table establishes a correspondence between the codes and their original complete information strings.

| Code | Scanner Message `201`-`299` |
| -------- | -------- |
| 201 | The requested package already exists in the registry. |

| Code | Validator Message `301`-`399` |
| -------- | -------- |
| 301 | The requested package's metadata is invalid or missing. |
| 302 | A required element is missing from the requested package's metadata. |
| 303 | The license format specified in the requested package's metadata is invalid. |
| 304 | The path to the package's main file directory is invalid. |
| 305 | Failed to load the requested package's metadata. |
| 306 | Inconsistency between the requested package name and the name specified in its metadata. |
| 307 | The dependency format for the requested package is invalid. |
| 308 | The format of the version specified in the metadata of the requested package is invalid. |


| Code | Dependencies Message `401`-`499` |
| -------- | -------- |
| 401 | One or more package dependencies are invalid or missing. |

| Code | Loader Message `501`-`599` |
| -------- | -------- |
| 501 | Failed to load the requested package. |
