#! /bin/bash

set -ex

ALSA_LIB="alsa-lib"
ALSA_LIB_VERSION="1.2.9"
ALSA_LIB_URL="https://www.alsa-project.org/files/pub/lib/"
ALSA_LIB_CONFIGURE_COMMAND="./configure
--prefix=$PREFIX
"

if [[ "$enableShared" == true  ]]; then
 ALSA_LIB_CONFIGURE_COMMAND=$ALSA_LIB_CONFIGURE_COMMAND"
 --enable-shared
 --disable-static
 "
else
 ALSA_LIB_CONFIGURE_COMMAND=$ALSA_LIB_CONFIGURE_COMMAND"
 --enable-static
 --disable-shared
 "
fi

echo "==========================download ${ALSA_LIB}=========================="
if [ ! -e $ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2" ]; then
    if [[ $SYSTEM == "Darwin" ]]; then
        curl $ALSA_LIB_URL$ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2" > $ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2"
    else
        wget $ALSA_LIB_URL$ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2" -O $ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2"
    fi
fi

echo "==========================unzip ${ALSA_LIB}=========================="
if [ -e $ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2" ]; then
    if [ -e $ALSA_LIB"-"$ALSA_LIB_VERSION ]; then
        rm -rf $ALSA_LIB"-"$ALSA_LIB_VERSION
    fi

    tar xvf $ALSA_LIB"-"$ALSA_LIB_VERSION".tar.bz2"
fi


echo "==========================build ${ALSA_LIB}=========================="
if [ -e $ALSA_LIB"-"$ALSA_LIB_VERSION ]; then
 cd $ALSA_LIB"-"$ALSA_LIB_VERSION
 $ALSA_LIB_CONFIGURE_COMMAND
 make clean
 make -j${cpu_num}
 make install
fi
cd $MY_DIR
echo "==========================${ALSA_LIB} build successful!=========================="
