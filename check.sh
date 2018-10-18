#!/bin/bash
SELF_PATH=$( cd -P -- "$( dirname "$0" )" && pwd -P )
$SELF_PATH/restic.sh check $@
