#!/bin/bash
#

if [[ -z "$1" ]]; then
  echo $"Usage: $0 <VERSION> [ARCH]"
  exit 1
fi

VERSION=$1

if [[ -z "$2" ]]; then
  ARCH=`uname -m`
else
  ARCH=$2
fi

case "${ARCH}" in
    i386)
        ZIP=${VERSION}_linux_386.zip
        ;;
    x86_64)
       ZIP=${VERSION}_linux_amd64.zip
        ;;
    *)
        echo $"Unknown architecture ${ARCH}" >&2
        exit 1
        ;;
esac

URL="https://dl.bintray.com/mitchellh/consul/${ZIP}"
echo $"Creating consul ${ARCH} package version ${VERSION}"

# fetching consul
curl -k -L -o $ZIP $URL || {
    echo $"URL or version not found!" >&2
    exit 1
}

# clear target foler
rm -rf target/*

# create target structure
mkdir -p target/usr/local/bin
mkdir -p target/etc/init.d
cp -r sources/consul/etc/ target/

# unzip
unzip -qq ${ZIP} -d target/usr/local/bin/
rm ${ZIP}

# create deb
fpm -s dir -t deb -f \
       -C target \
       -n consul \
       -v ${VERSION} \
       -p target \
       -a ${ARCH} \
       --after-install spec/service_install.spec \
       --after-remove spec/service_uninstall.spec \
       --description "Consul package" \
       --url "https://github.com/hypoport/consul-deb" \
       usr/ etc/

rm -rf target/etc target/usr
