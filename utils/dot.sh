#!/bin/sh

IN="$1"
OUT="$1.png"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input.dot"
	exit 1
fi
dot -Tpng "$IN" -o "$OUT"
open "$OUT"
