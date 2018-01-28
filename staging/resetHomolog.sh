#!/bin/bash

cd run 
./stopAll.sh
cd ..

cd scripts
./resetDatabase.sh
./updateBinaries.sh
cd ..

cd run
./startAll.sh
cd ..

echo "[INFO] Script finished. (servers might still be starting in the background)"
echo "[INFO] Remember to run any migration scripts if necessary for this deployment"
