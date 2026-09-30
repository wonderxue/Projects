#!/bin/bash
set -e
mkdir -p build
cd build
cmake .. -DPIXEL_SIZE=8 -DSCREEN_PIXELS_X=64 -DSCREEN_PIXELS_Y=32 -DMARGIN=10
make -j$(sysctl -n hw.ncpu)
echo ""
echo "Build OK! Run:  ./build/pixelscreen"
