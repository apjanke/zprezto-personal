apjanke's zprezto-personal
==========================

This is a module of Prezto [contrib](https://github.com/sorin-ionescu/prezto/pull/1458) modules and themes by [apjanke](https://github.com/apjanke).

There is nothing useful in here yet! This is a work-in-progress that I'm putting together as I learn Prezto and decide whether to migrate to it from Oh My Zsh.

# Installation

Add this as a contrib module to your Prezto installation.

```
cd ~/.zprezto
mkdir -p contrib/apjanke
cd contrib/apjanke
git clone https://github.com/apjanke/zprezto-personal personal
```

And then load it in your `~/.zpreztorc`, and select one of the themes from it.

```sh
() {
local pmodules
pmodules=(
  'environment'
  'terminal'
  'editor'
   ...
  'apjanke/personal/themes'
   ...
  'prompt'
   )
zstyle ':prezto:load' pmodule $pmodules
}

zstyle ':prezto:module:prompt' theme 'apjanke-01'
```

# Defined Themes

##  apjanke-01

WORK IN PROGRESS.

A port of my Oh My Zsh theme inspired by "My Extravagant Zsh Prompt" and Agnoster.

##  apjanke-02

A more compact one-line version of apjanke-01.


#  More doco

* Prezto's [PR for Contrib support](https://github.com/sorin-ionescu/prezto/pull/1458)
* My [Prezto Contrib repo organization conventions](_doc/Prezto-Contrib-Conventions.md)
* [Notable Prezto Contrib Repos](_doc/Notable-Contrib-Repos.md)
