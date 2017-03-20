#!/bin/bash

rm -rf libscclust
mkdir libscclust
wget https://github.com/fsavje/scclust/archive/master.zip
unzip master.zip
cd libscclust
../scclust-master/configure --with-clabel=int --with-clabel-na=min --with-typelabel=int --with-pointindex=int
cd ..
rm -r scclust-master master.zip
rm -r libscclust/examples libscclust/DoxyAPI libscclust/doxyrefs.bib libscclust/Makefile libscclust/README.md
