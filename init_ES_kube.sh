#!/bin/bash -e
# ---------------------------------------------------------------------------- #
echo ""
echo "--- Initialize ElasticSearch over Kubernetes ---------------------------"
echo ""
set -x

# --- Start the ES masters --------------------------------------------------- #
kubectl create -f es-discovery-svc.yaml
kubectl create -f es-svc.yaml
kubectl create -f es-master.yaml
kubectl rollout status -f es-master.yaml

# --- Start the ES ingest ---------------------------------------------------- #
kubectl create -f es-ingest-svc.yaml
kubectl create -f es-ingest.yaml
kubectl rollout status -f es-ingest.yaml

# --- Start the ES storage --------------------------------------------------- #
kubectl create -f es-data.yaml
kubectl rollout status -f es-data.yaml

# --- Start the ES Kibana ---------------------------------------------------- #
kubectl create -f kibana-cm.yaml
kubectl create -f kibana-svc.yaml
kubectl create -f kibana.yaml

# --- Start the ES - Done ---------------------------------------------------- #
set +x
exit 0
