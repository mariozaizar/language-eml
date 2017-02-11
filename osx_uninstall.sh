#!/bin/sh

PACKAGE_PATH=$HOME/.atom/packages/language-eml

rm $PACKAGE_PATH && echo "$PACKAGE_PATH link got removed." || echo "Can't remove $PACKAGE_PATH"
