#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/openservicemesh/osm/releases/download
APP=osm

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file="${APP}-${ver}-${platform}.${archive_type}"
    local url=$MIRROR/$ver/$file
    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $platform $(grep -e "$file\$" $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local url=$MIRROR/$ver/sha256sums.txt

    local lchecksums=$DIR/osm-${ver}-sha256sums.txt
    if [ ! -e $lchecksums ];
    then
        wget -q -O $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums windows amd64
}
dl_ver ${1:-v0.3.0}
