#!/bin/bash
INPUT=$1
OUTPUT=$1.png

dot -Tpng $INPUT -o $OUTPUT
open $OUTPUT
