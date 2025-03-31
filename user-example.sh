#!/bin/bash

mkdir -p ./rtcstats/rtc-visualizer/.data

cat <<EOF > ./rtcstats/rtc-visualizer/.data/users.json
{
    "admin": "admin"
}
EOF

echo "users.json has been created in .data directory."
