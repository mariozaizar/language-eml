#!/bin/sh

INSTALL_PATH=$HOME/.atom/packages/language-eml
ln -siv $PWD $INSTALL_PATH

echo "Now restart Atom, and open example.eml file."
