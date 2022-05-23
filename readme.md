# Dreck Terser Plugin [![License](https://img.shields.io/github/license/sunruse/dreck-js-plugin.svg)](https://github.com/sunruse/dreck-terser-plugin/blob/master/license) [![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

Minifies all `*.js` source files (and specific `*.js` intermediate files) to equivalent `*.min.js` intermediate files (e.g. `./src/a/b.js` minifies to `./ephemeral/intermediate/a/b.min.js`).

## Dependencies

- NodeJS 10.19.0 or later.
- NPM 6.14.4 or later.
- NPX 6.14.4 or later.

All must be available on the PATH (e.g. `node --version`, `npm --version` and `npx --version` all print version strings when executed in a Bash terminal).

### Installing on Debian-based Linux distributions

These are available from most Debian-based Linux distributions' package managers; for example, they can be installed when running Ubuntu 20.04 LTS using the following command:

```bash
sudo apt-get install nodejs npm --yes
```

### Installing within GitHub Actions

Add an appropriate [actions/setup-node](https://github.com/actions/setup-node) action step **before** the `make` action step:

```yml
name: Continuous Integration
on: [push, pull_request]
jobs:
  main:
    runs-on: ubuntu-20.04
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: true

    # Insert this block:
    ###############################
    - uses: actions/setup-node@v3
      with:
        node-version: 12
    ###############################

    - run: make --file ./submodules/dreck/makefile
      shell: bash
    - if: github.event_name == 'release' && github.event.action == 'created'
      uses: softprops/action-gh-release@v1
      with:
        files: dist/**
```

## Installation

Run the following in a Bash shell at the root of your project:

```bash
git submodule add https://github.com/sunruse/dreck-terser-plugin submodules/plugins/terser
```

## Minifying of generated Javascript files

By default, this plugin will minify all `*.js` files in `./src/**` and `./submodules/plugins/*/src/**`.

It can additionally render Javascript files in `./ephemeral/intermediate`, but requires that their paths be appeneded to the `DRECK_INTERMEDIATE_JAVASCRIPT_PATHS` Make variable.

For example, if `DRECK_INTERMEDIATE_JAVASCRIPT_PATHS` contained `./a/b.js`, the Javascript file at `./ephemeral/intermediate/a/b.js` would be rendered to `./ephemeral/intermediate/a/b.min.js`.

## Output as HTML variable

The absolute paths to all files generated by this plugin are appended to the `DRECK_HTML_VARIABLE_PATHS` Make variable and can therefore be used as variables in templated HTML.
