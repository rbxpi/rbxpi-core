---
title: logging - Advanced Logging
createTime: 2026/02/07 19:13:10
permalink: /api/stdlib/logging
---

A package that defines functions implementing a flexible event logging system.

---

## Summary

### Methods

:::table full-width
||
| -- |
| [config](#config) (configTable: { threshold: string?, autoDebug: boolean?, logger: boolean? }) : nil |
| [log](#log) (message: string, level: string) : nil |
| [getLevel](#getlevel) (name: string?) : { index: number, flags: { string } } \| { [string]: { index: number, flags: { string } } }|
| [addLevel](#addlevel) (name: string, index: number, flags: { string }?, autoFixIndex: boolean?) : boolean |
| [removeLevel](#removelevel) (name: string) : nil |
| [getLogs](#getlogs) () : { string } |
| [clearLogs](#clearlogs) () : nil |
:::

The main advantage of having the logging API provided by a standard library module is that all RbxPI modules can use logging, so your log can include your own messages alongside messages from third-party modules.

The logging system contains different priority levels that you can create yourself. You can configure the logger’s behavior and validate certain logging levels in the Roblox environment.

---

## Configuration

:::: field-group

::: field name="logging.__threshold" type="string" default="INFO"
Logging priority level.
:::

::: field name="logging.__autoDebug" type="boolean" default="True"
Automatically enable `DEBUG` mode if the experience is running in Roblox Studio.
:::

::: field name="logging.__logger" type="boolean" default="True"
Manage log recording.
:::

::::

These settings can be modified via the [`logging.config()`](#config) function, which allows configuring the module.

## Methods

#### config

Configures the package with certain arguments.

```luau
logging.config(
    configTable: {
        threshold : string?, autoDebug : boolean?, logger : boolean?
    }
) : nil
```

**Parameters**

:::: field-group

::: field name="configTable" type="tuple" optional

:::: field-group

::: field name="threshold" type="string?" optional
Logging priority level.
:::

::: field name="autoDebug" type="boolean?" optional
Automatically enable `DEBUG` mode if the experience is running in Roblox Studio.
:::

::: field name="logger" type="boolean?" optional
Manage log recording.
:::

::::

This function configures the `logging` package by applying the options provided in `configTable`. It allows setting the message priority level via `threshold`, which controls which logs are shown or ignored based on their severity. This helps filter messages according to importance and prevents cluttering the output with non-essential information.

The `autoDebug` option automatically enables `DEBUG` mode if the game is running in Roblox Studio. This facilitates development and debugging by displaying detailed information without manually changing the configuration each session.

The `logger` option controls whether messages are actually recorded. It allows temporarily disabling logging while keeping log calls in the code, useful for testing or environments where recording is unnecessary.

Parameters not provided do not modify existing configuration, offering flexibility to adjust only the necessary aspects of the package behavior without resetting other settings.

#### log

Creates a message sent to the experience console with a specific priority level.

```luau
logging.log(
    message : string, level : string
) : nil
```

**Parameters**

:::: field-group

::: field name="message" type="string"
Message to send to the experience console.
:::

::: field name="level" type="string"
Priority level of the message.
:::

::::

This function creates a message and sends it to the experience console with the specified priority level. The `message` parameter is the text to display, while `level` determines the importance or severity of the message, allowing filtering or highlighting certain information based on priority.

It integrates with the `logging` package system, ensuring all messages respect the current configuration, such as the threshold defined by `threshold` or automatically enabled `DEBUG` mode in Studio.

Using this function helps track code execution, debug more easily, and have a clear record of important events in the console while keeping the ability to filter or disable certain messages as needed.

#### getLevel

Retrieves information for a specific log level or all log levels.

```luau
logging.getLevel(
    levelName: string?
) : { index: number, flags: { string } } | { [string]: { index: number, flags: { string } } }
```

**Parameters**

:::: field-group

::: field name="levelName" type="string?" optional
Optional name of the log level to retrieve. If no name is provided, the function returns all existing log levels.
:::

::::

**Returns**

:::: field-group
::: field type="table"
An array or a set of strings representing different values
:::

:::: field-group
An array containing:

::: field name="index" type="number"
Log level number.
:::

::: field name="flags" type="table"
Set of strings representing the flags associated with the level.
:::

:::: field-group
A dictionary where each key is a log level name and each value contains:

::: field name="index" type="number"
Log level number.
:::

::: field name="flags" type="table"
Set of strings representing the flags associated with the level.
:::

::::

This function retrieves information about a specific log level or all defined levels in the logging system. If a `levelName` is provided, it returns only the data for that level, including its index number and associated flags. If no name is provided, it returns a complete dictionary of all existing levels, allowing easy access to their properties.

It integrates with the `logging` package and allows developers to dynamically inspect or use log levels, for example to filter, sort, or display messages based on severity or specific characteristics.

Using this function makes fine-grained log management easier by offering a centralized, structured view of different levels and their attributes while maintaining flexible access for specific needs.

#### addLevel

Adds a new custom log level to the `logging` package.

```luau
logging.addLevel(
    name : string, index : number, flags : {string}?, autoFixIndex: boolean?
): boolean
```

**Parameters**

:::: field-group

::: field name="name" type="string"
Name of the level you want to create. This name is used to identify the level in log calls.
:::

::: field name="index" type="number"
Associated priority level. Levels with a higher index are considered more important. This affects which messages are shown or ignored based on the configured threshold.
:::

::: field name="flags" type="table? optional"
Optional properties to associate with the level. Possible values include:

* `canWarn` : the level can generate warnings.
* `advancedOutput` : the level produces detailed logs with extra information.
  :::

::: field name="autoFixIndex" type="boolean? optional"
If `true`, automatically corrects the level index if it is already used by another level. This avoids conflicts and ensures each level has a unique index.
:::

::::

**Returns**

:::: field-group

::: field type="boolean"
Returns `true` if the level was successfully added, `false` if adding failed (e.g., due to a name conflict or unresolvable index).
:::

::::

This function extends the logging system by adding new custom levels. The `name` parameter defines the level name, while `index` indicates its relative priority. `flags` allow specifying special behaviors for the level, such as allowing warnings or enabling detailed output.

The `autoFixIndex` option is useful to prevent index conflicts by automatically adjusting the value if another level already uses the same index. This keeps the system consistent without manually managing priorities.

On success, the function returns `true`, confirming that the level has been added and is ready for logging.

#### removeLevel

Removes an existing log level from the `logging` package.

```luau
logging.removeLevel(
    name: string
): nil
```

**Parameters**

:::: field-group

::: field name="name" type="string"
Name of the log level to remove. This name must exactly match the one used when adding it with `addLevel`.
:::

::::

This function removes a previously created log level. Once removed, the level can no longer be used in log calls.

This is useful for cleaning up temporary or obsolete levels or reorganizing the priority hierarchy without restarting the experience.

The function returns no value (`nil`) and removed levels are permanently deleted from the current configuration.

#### getLogs

Retrieves all logs currently recorded by the `logging` package.

```luau
logging.getLogs(
): { string }
```

**Returns**

:::: field-group

::: field type="table"
Table containing all log messages as strings (`string`). Each element corresponds to a recorded message in chronological order.
:::

::::

This function provides access to all logs generated since the experience started or since the last log reset.

It is useful for analyzing code behavior, exporting logs for debugging, or displaying message history in custom interfaces.

The returned table is independent and can be iterated or copied without affecting ongoing log recording.

#### clearLogs

Clears all logs currently recorded by the `logging` package.

```luau
logging.clearLogs(
): nil
```

`clearLogs` removes all stored log messages so far. This is useful for resetting log history, for example before starting a new test session or after exporting messages for analysis.

The function returns no value (`nil`) and all previously recorded logs are permanently erased.

*[string]: A sequence of characters, such as letters, numbers, and symbols.
*[boolean]: Data type with a true or false value.
*[nil]: Any type