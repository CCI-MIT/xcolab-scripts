#!/bin/bash

./scripts/updateBinaries.sh

cd run
./stopAll.sh
./startAll.sh
cd ..
