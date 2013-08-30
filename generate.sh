#!/bin/sh
mkdir data grafy grafy-png grafy-svg csv
./stahni.sh
./make_grafy.sh
./make_grafy.sh SVG
./make_grafy.sh PNG
./make_csv.sh
