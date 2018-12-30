#!/bin/bash -e
# ---------------------------------------------------------------------------- #
INTERVAL_SECS=60

echo "--- Monitor the amount of running ES nodes -----------------------------"
echo "(at ${INTERVAL_SECS} secs interval)"

while :;
do
  ES_NODES_COUNT=`kubectl get pod -l "role=master" -l "component=elasticsearch" | grep 'Running' | wc -l`
  echo "$(date) | Running ES Nodes: ${ES_NODES_COUNT}"
  sleep ${INTERVAL_SECS}
done
