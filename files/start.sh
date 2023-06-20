#!/bin/bash
echo "start collectd_client container"
CMD="collectd -f -C \"${CONFIG}\" 2>&1"

echo "$CMD"
eval "$CMD"
