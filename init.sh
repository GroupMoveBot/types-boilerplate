#/usr/bin/env bash

[[ -z $PACKAGE_NAME ]] && echo '$PACKAGE_NAME must be specified.' && exit 1
[[ -z $AUTHOR_NAME ]] && echo '$AUTHOR_NAME must be specified.' && exit 1
[[ -z $AUTHOR_EMAIL ]] && echo '$AUTHOR_EMAIL must be specified.' && exit 1
[[ -z $LICENCE ]] && LICENCE='SEE LICENCE IN LICENCE.md'

rm init.sh

rm -rf .git
git init

TEMP=`mktemp`
envsubst < package.json > $TEMP
mv $TEMP package.json

git add .
git commit -m "Initial commit"
