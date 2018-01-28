#!/bin/bash

snapshot_file=latest_snapshot.sql.bz2

echo "[INFO] Downloading latest database snapshot..."
scp snapshots@cognosis2.mit.edu:climatecolab/${snapshot_file} ./
echo "[INFO] Importing database..."
pv -cN Compressed < ${snapshot_file} | bunzip2 | pv -bcN Raw | mysql 
rm ${snapshot_file}

echo "[INFO] Running test server specific setup..."
# homolog-specific settings (e.g. extra admins, remove shared contests)
cat post-migration-setup.sql | mysql

echo "[INFO] All done!"
