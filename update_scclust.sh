#!/bin/bash

rm -rf libscclust
mkdir libscclust
wget https://github.com/fsavje/scclust/archive/master.zip
unzip master.zip
cd libscclust
../scclust-master/configure --with-typelabel=int
cd ..
rm -r scclust-master master.zip
rm -r libscclust/examples libscclust/DoxyAPI libscclust/doxyrefs.bib libscclust/Makefile libscclust/README.md
