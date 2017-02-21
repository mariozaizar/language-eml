#!/bin/sh

# OSX Sierra: "/Users/mzaizar/.atom/packages"
# Windows 10: "C:\Users\Mario\.atom\packages"

INSTALL_PATH=$HOME/.atom/packages;
PACKAGE_PATH=$INSTALL_PATH/language-eml;

mkdir -p $INSTALL_PATH;
ln -siv $PWD $INSTALL_PATH && echo "This directory got linked in $PACKAGE_PATH" || echo "Can't link this directory to $PACKAGE_PATH"
