#!/bin/bash
autoreconf -vfi

export M4=${BUILD_PREFIX}/bin/m4
./configure --prefix=${PREFIX}

make -j ${CPU_COUNT} install
