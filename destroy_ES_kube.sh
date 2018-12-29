#!/bin/bash
# ---------------------------------------------------------------------------- #
echo ""
echo "--- Remove ElasticSearch over Kubernetes -------------------------------"
echo ""
set -x

# --- Clean the ES Kibana ---------------------------------------------------- #
kubectl delete -f kibana.yaml
kubectl delete -f kibana-svc.yaml
kubectl delete -f kibana-cm.yaml

# --- Clean the ES storage --------------------------------------------------- #
kubectl delete -f es-data.yaml

# --- Clean the ES ingest ---------------------------------------------------- #
kubectl delete -f es-ingest.yaml
kubectl delete -f es-ingest-svc.yaml

# --- Clean the ES masters --------------------------------------------------- #
kubectl delete -f es-master.yaml
kubectl delete -f es-svc.yaml
kubectl delete -f es-discovery-svc.yaml

# --- Clean the ES - Done ---------------------------------------------------- #
set +x
exit 0
