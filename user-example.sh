#!/bin/bash

mkdir -p ./rtc-visualizer/.data

cat <<EOF > ./rtc-visualizer/.data/users.json
{
    "admin": "admin"
}
EOF

echo "users.json has been created in .data directory."
