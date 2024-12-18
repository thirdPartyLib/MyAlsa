#! /bin/bash

# set -e

source ./tools.sh
source ./config.sh

# if [ -e "output" ]; then
#     rm -rf output
# fi

mkdir -p output
mkdir -p output/bin

# . update_submodule.sh
. build_alsa_lib.sh