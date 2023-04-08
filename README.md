# GMAssert 2

Assertion scripts for GameMaker Studio 2.3.7+ and LTS 2022+

```
assert_not_equal("untested code", "good code", "You should have used GMAssert!");
```

## Introduction

GMAssert is a library containing useful assertions for debugging and automated unit testing. You can use it to alert you to undesirable runtime conditions, pause the debugger at that point for further inspection, or quickly test code for expected behaviour.

## Requirements

GameMaker Studio 2.3.7 or above / 2022.0 or above

- If you use GameMaker Studio 2.3.6 or lower, please use [v2.2.1](https://github.com/dicksonlaw583/gmassert2/releases/tag/v2.2.1).
- If you use GameMaker Studio 2.2.5 or lower, please use [v2.0.0](https://github.com/dicksonlaw583/gmassert2/releases/tag/v2.0.0).
- If you use GameMaker Studio 1.4, please see [GMAssert Legacy](https://github.com/dicksonlaw583/gmassert-legacy).

## Before Upgrading

- If you have made custom changes to `__GMA_BREAKPOINT__`, please back up the changes to a file, then re-apply them after the installation.
- If you are upgrading from v2.2.1 or below, please remove GMAssert entirely and install from scratch.

## Installation

- Get the current release and associated documentation from [the releases page](https://github.com/dicksonlaw583/gmassert2/releases), or download the latest version from [the YoYo Marketplace](https://marketplace.yoyogames.com/assets/8164/gmassert).
- Export the `Libraries` group from the downloaded asset package. If this is your first installation or an upgrade from v2.1.0 or below, also export the `Libraries_config` group.

## Contribution to GMAssert

- Clone this repository.
- Open the project in GameMaker Studio LTS and make your additions/changes to the `GMAssert` group. Also add corresponding tests to the `GMAssert_test` group.
- Open a pull request [here](https://github.com/dicksonlaw583/gmassert2/issues).

