#!/bin/sh

##
# Keep local path in sync with remote path on server.
# Ignore .git metadata.
#
remote=$1

rsync -viru --delete . rsync://$remote/bphug
fswatch . "date +%H:%M:%S && rsync -viru --delete . rsync://$remote/bphug"
