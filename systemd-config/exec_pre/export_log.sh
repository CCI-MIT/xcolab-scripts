#!/bin/bash

# Output service log only from last execution, or from the beginning if pattern is not found
lastGrepLineNumber=$(/usr/bin/journalctl -u $1 | grep -n "Starting $2 Service" | cut -f1 -d: | tac | sed -n 2p)
if [ -z $lastGrepLineNumber ]; then
	echo "$(/usr/bin/journalctl -u $1)"
else
	echo "$(/usr/bin/journalctl -u $1 | tail -n +$lastGrepLineNumber)"
fi
