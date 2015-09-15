#!/bin/bash -eu

SCRIPT=$(readlink -m $(type -p "$0"))
SCRIPTDIR=${SCRIPT%/*}      

usage() {
    echo -e "Makes 'masks.txt' and 't1s.txt'"
}

[ $# -eq 0 ] || usage

datadir="$SCRIPTDIR/"
ls -1 $datadir/*edited.nrrd | sed "s|.*\/|$datadir|" > masks.txt
ls -1 $datadir/*realign.nrrd | sed "s|.*\/|$datadir|" > t1s.txt
