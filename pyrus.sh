#!/bin/bash

## install pyrus specific to the given php version
## automatically tries to download latest pyrus version if
## there is none in bzips/

. confirm.fn.sh

if [ $# -eq 1 ]
then
  version="$1"
  instdir="../inst/php-$version"
else
  version="$1"
  instdir="$2"
fi

if [ ! -d "$instdir" ]; then
    echo "PHP installation directory does not exist: $instdir"
    exit 2
fi

echo "Install version: $version"
echo "Install directory: $instdir"

confirm "Are you sure you want to install Pyrus? (yes/no)"
if [ $? -eq 1 ]; then
  exit 0
fi

echo "Starting with the installation ..."

pwd=`pwd`
cd "`dirname "$0"`"
basedir=`pwd`
cd "$pwd"

pyrusphar="$basedir/bzips/pyrus.phar"
pyrustarget="$instdir/pyrus.phar"
if [ ! -f "$pyrusphar" ]; then
    #download pyrus from svn
    wget -O "$pyrusphar" "http://svn.php.net/viewvc/pear2/Pyrus/trunk/pyrus.phar?view=co"
else
  echo "Using cached file: $pyrusphar"
fi

if [ ! -f "$pyrusphar" ]; then
    echo "Please put pyrus.phar into bzips/"
    exit 3
fi

cp "$pyrusphar" "$pyrustarget"
mkdir -p "$instdir/pear"

pyrusbin="$instdir/bin/pyrus"
echo '#!/bin/sh'> "$pyrusbin"
echo "\"$instdir/bin/php\" \"$pyrustarget\" \"$instdir/pear\" \$@ " >> "$pyrusbin"
chmod +x "$pyrusbin"
"$pyrusbin" set php_prefix "$instdir/bin/"

#symlink
ln -sf "$pyrusbin" "$instdir/../bin/pyrus-$version"

echo "include_path=\".:$instdir/pear/php/\"" >> "$instdir/lib/php.ini"
