#!/bin/sh

workspace=/tmp/bphug-ci-server

mkdir -p $workspace
cp . -R $workspace

rsync --daemon --no-detach --config=./ci/rsyncd.conf -v &

cd $workspace
fswatch . ./ci/ci-worker.sh
