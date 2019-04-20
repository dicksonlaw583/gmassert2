# GMAssert v2.0.0

Assertion scripts for GameMaker Studio 2.x

```
assert_not_equal("untested code", "good code", "You should have used GMAssert!");
```

## Introduction

GMAssert is a library containing useful assertions for debugging and automated unit testing. You can use it to alert you to undesirable runtime conditions, pause the debugger at that point for further inspection, or quickly test code for expected behaviour.

## Requirements

- GameMaker Studio 2.2.2 or above

If you use GameMaker Studio 1.4, please see [GMAssert Legacy](https://github.com/dicksonlaw583/gmassert-legacy).

## Installation

Download the latest version from [the YoYo Marketplace](https://marketplace.yoyogames.com/assets/8164/gmassert).

*Optional:* If you wish to use the debugger or customize failure handling behaviour, export the extension's included `__GMA_BREAKPOINT__` script and follow the instructions inside.

## Contribution to GMAssert

- Clone this repository.
- Open the workbench in GameMaker Studio and make your additions/changes to the `GMAssert` extension. Also add corresponding tests to the `gmassert_test`.
- Open a pull request [here](https://github.com/dicksonlaw583/gmassert2/issues).
