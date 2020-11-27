#!/bin/sh
aws s3 sync s3://scitace /s3
stahni.sh
make_grafy.sh
make_grafy.sh SVG
make_grafy.sh PNG
make_csv.sh
aws s3 sync /s3 s3://scitace
