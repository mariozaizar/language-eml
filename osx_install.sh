#!/bin/sh

INSTALL_PATH=$HOME/.atom/packages;
mkdir -p $INSTALL_PATH;

PACKAGE_PATH=$INSTALL_PATH/language-eml;
ln -siv $PWD $INSTALL_PATH && echo "This directory got linked in $PACKAGE_PATH" || echo "Can't link this directory to $PACKAGE_PATH"
