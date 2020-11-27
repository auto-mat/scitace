#!/bin/bash
for i in `ls data-combined/*.csv`; do graf.plot $i $1; done

