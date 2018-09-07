#!/bin/bash
NUM=$1
re='^[0-9]+$'
known_hosts="${HOME}/.ssh/known_hosts"

if ! [[ $NUM =~ $re ]] ; then
   echo "Specify the line number of the offending key" >&2; exit 1
fi

echo "Deleting key:"
sed "${NUM}q;d" "$known_hosts"
sed -if "${NUM}d" "$known_hosts"
echo "Entries left: "
wc -l < "$known_hosts"
