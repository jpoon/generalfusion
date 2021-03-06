#!/bin/bash
set -ex

pachctl port-forward & 

# calibration
pachctl create-repo calibration
echo "1,1,1" | pachctl put-file calibration master -c calibration.csv

# data
cd data/experiment
pachctl create-repo raw
pachctl put-file -r raw master -c -f injector1
