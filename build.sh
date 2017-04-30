#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "Argumente: build.sh xml-Datei Wikiname"
	exit 1
fi

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd wikireader
make WORKDIR=$DIR/work/ DESTDIR=$DIR/image/ XML_FILES=$DIR/source/$1.xml WIKI_DIR_SUFFIX=$1 WIKI_LANGUAGE=de createdirs iprc >> /dev/null
if [ -e "$DIR/image/depedia" ]
then
	rm -R $DIR/image/depedia
fi
mv $DIR/image/de$1 $DIR/image/depedia 
cp $DIR/translations/de/wiki.nls $DIR/image/depedia/
sed "s/#wikiTitle#/$2/" $DIR/translations/de/wiki.nls > $DIR/image/depedia/wiki.nls
echo ""

