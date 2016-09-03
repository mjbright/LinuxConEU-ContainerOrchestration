#!/bin/bash

################################################################################
# Configuration:

INSTALL_DIR=$HOME/ContainerConEU2016-OrchestnLab
ARCHIVE_DIR=$INSTALL_DIR/Archives

KUBE_UNTAR_DIR=$INSTALL_DIR
KUBE_DIR=$INSTALL_DIR/kubernetes

KUBE_RELEASE=1.3.6
KUBE_RELEASE_FILE_SIZE=1488182774
KUBE_RELEASE_FILE_md5=7dbbbb70b2b0c2a614cb4fd70e61c62a

################################################################################
# Functions:

die() {
    echo "$0: $*" >&2
    exit 1
}

press() {
    echo "$*"
    echo "Press <return> to continue"
    read _DUMMY
    [ "$_DUMMY" eq "q" ] && exit 0
    [ "$_DUMMY" eq "Q" ] && exit 0
}

makedir() {
    DIR=$1
    [ ! -d $DIR ] && mkdir -p $DIR
    [ ! -d $DIR ] && die "Failed to 'mkdir -p $DIR'"
}

INSTALL_sw() {
    SW=$1; shift
    SW_RELEASE=$1; shift
    SW_URL=$1; shift
    SW_DOWNLOAD=$1; shift
    ARCHIVE_FILE=$1; shift
    ARCHIVE_FILE_SIZE=$1; shift
    ARCHIVE_FILE_MD5=$1; shift
    SW_UNTAR_DIR=$1; shift
    SW_INSTALL_DIR=$1; shift

    ARCHIVE_PATH=$ARCHIVE_DIR/$ARCHIVE_FILE

    echo "--------------------------"
    echo "- Installing $SW"

    if [ -f $ARCHIVE_PATH ]; then
        if [ `wc -c < $ARCHIVE_PATH` == $ARCHIVE_FILE_SIZE ];then
            SW_DOWNLOAD=0
        fi
    fi

    [ $SW_DOWNLOAD -ne 0 ] && {
        echo "-- Downloading $SW release <$SW_RELEASE>";
        echo "--- to <$ARCHIVE_PATH>";
        echo "    curl -o $ARCHIVE_PATH $SW_URL";
        curl -o $ARCHIVE_PATH $SW_URL;
    }

    [ ! -d $SW_INSTALL_DIR ] && {
        echo "-- Untarring $SW release <$SW_RELEASE>";
        echo "--- to <$SW_UNTAR_DIR>";
        echo "    tar -C $SW_UNTAR_DIR -xf $ARCHIVE_PATH";
        tar -C $SW_UNTAR_DIR -xf $ARCHIVE_PATH;
    }
}


INSTALL_kubernetes() {
    KUBE_URL=https://storage.googleapis.com/kubernetes-release/release/v$KUBE_RELEASE/kubernetes.tar.gz
    KUBE_FILE=kubernetes_v$KUBE_RELEASE.tar.gz

    KUBE_DOWNLOAD=1
    INSTALL_sw "kubernetes" $KUBE_RELEASE $KUBE_URL KUBE_DOWNLOAD $KUBE_FILE \
                            $KUBE_RELEASE_FILE_SIZE $KUBE_RELEASE_FILE_md5 \
                            $KUBE_UNTAR_DIR $KUBE_DIR
}

################################################################################
# Main:

#curl -sS https://get.k8s.io > get.k8s.io.sh
#chmod +x get.k8s.io.sh

#KUBERNETES_SKIP_DOWNLOAD=skip_download

#./get.k8s.io.sh

makedir $INSTALL_DIR
echo "- Installing to '$INSTALL_DIR'"

makedir $ARCHIVE_DIR

INSTALL_kubernetes $KUBE_RELEASE

