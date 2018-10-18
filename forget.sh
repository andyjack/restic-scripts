#!/bin/bash
SELF_PATH=$( cd -P -- "$( dirname "$0" )" && pwd -P )
$SELF_PATH/restic.sh forget --keep-last 10 --keep-daily 7 --keep-weekly 5 --keep-monthly 13 --prune
