#!/bin/bash
set -e
set -u
set -o pipefail

SELF_PATH=$( cd -P -- "$( dirname "$0" )" && pwd -P )
. $SELF_PATH/env.sh
export RESTIC_PASSWORD_FILE="$SELF_PATH/$PASSWORD_FILE"

restic $@
