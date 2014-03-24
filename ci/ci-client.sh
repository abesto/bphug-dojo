#!/bin/sh
# Sync stuff to rsync://$1/bphug when anything changes

remote=$1

rsync -viru --delete . rsync://$remote/bphug
fswatch . "date +%H:%M:%S && rsync -viru --delete . rsync://$remote/bphug"
