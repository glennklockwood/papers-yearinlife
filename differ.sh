#!/bin/bash
set -e

pdir=`pwd`
tdir=`mktemp -d`
cd $tdir
git clone https://git.overleaf.com/13925041wxnhdbpjvcnv
mv 13925041wxnhdbpjvcnv old

git clone https://git.overleaf.com/13925041wxnhdbpjvcnv
mv 13925041wxnhdbpjvcnv diff

cd old
git checkout 05819139b1bf4ae0a8e0258e456c3e20b55f859b
make
cd ../

cd diff
make
cd ../

latexdiff --flatten old/main.tex $pdir/main.tex > diff/main.tex
cd diff
make clean
make
cp main.pdf $pdir/revision-diff.pdf

