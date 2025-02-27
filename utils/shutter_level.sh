#!/bin/bash
# Sends a command to position the shutter in front of my computer at a certain level
re="[0-9]+"
if ! [[ $1 =~ $re ]] ; then
    echo "Shutter level is not a number"
    exit 1
fi

if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
    echo "Specify a shutter level between 0 (closed) and 100 (open)" >&2; exit 1
    exit 1
fi

# Which shutter should I change?
case "$2" in
    side)
        # Side window
        DEVICE=2
    ;;
      *)
        # Front window
        DEVICE=9
    ;;
esac


curl "http://192.168.1.33/port_3480/data_request?id=lu_action&output_format=json&DeviceNum=$DEVICE&serviceId=urn:upnp-org:serviceId:Dimming1&action=SetLoadLevelTarget&newLoadlevelTarget=$1"
