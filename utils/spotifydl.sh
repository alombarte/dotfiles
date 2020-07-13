#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 http://playlist"
	exit 1
fi

FILE="$(echo "$1"| md5sum | awk '{print $1}').txt"
docker run --rm -it -v "$(pwd):/music" ritiek/spotify-downloader --playlist "$1" --write-to "$FILE"
docker run --rm -it -v "$(pwd):/music" ritiek/spotify-downloader --overwrite skip --list "$FILE"
rm -f "$FILE"

