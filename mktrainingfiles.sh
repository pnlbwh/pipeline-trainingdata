#!/bin/bash -eu

SCRIPT=$(readlink -m $(type -p "$0"))
SCRIPTDIR=${SCRIPT%/*}      

usage() {
    echo -e "Makes 'masks.txt', 't1s.txt' and 'trainingdata.csv'
Usage: 
    ${1##*/} [<dir>]

    <dir>   output directory (default: current directory)
    "
}

dirOutput="."
if [ $# -gt 0 ]; then 
    [[ "$1" != "-h" ]] || { usage; exit 0; }
    dirOutput=$1
fi

datadir="$SCRIPTDIR/"
ls -1 $datadir/*edited.nrrd | sed "s|.*\/|$datadir|" > $dirOutput/masks.txt
ls -1 $datadir/*realign.nrrd | sed "s|.*\/|$datadir|" > $dirOutput/t1s.txt
paste -d, $dirOutput/t1s.txt $dirOutput/masks.txt > $dirOutput/trainingDataT1.csv
