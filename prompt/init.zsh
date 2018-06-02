#!/bin/zsh
#

#
# Some functions to control directory display
#
# (I don't know if there are equivalents in core Prezto;
# if there are, I'll just switch to those.)
#

function full-dirs {
  zstyle ':prezto:module:prompt' pwd-length 'full'
}

function long-dirs {
  zstyle ':prezto:module:prompt' pwd-length 'long'
}

function short-dirs {
  zstyle ':prezto:module:prompt' pwd-length 'long'
}