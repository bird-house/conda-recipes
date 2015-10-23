#!/bin/bash

# Copy prebuild binary to prefix/bin/
mkdir -p "$PREFIX/bin"
cp "$SRC_DIR/ncregrid/bin/ncregrid" "$PREFIX/bin/ncregrid"
# Make sure the binary is executable
chmod +x "$PREFIX/bin/ncregrid"
