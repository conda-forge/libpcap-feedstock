#!/bin/bash

# xref: https://github.com/conda-forge/bison-feedstock/issues/7
export M4=m4

./configure --prefix=${PREFIX}

make -j ${CPU_COUNT} install
