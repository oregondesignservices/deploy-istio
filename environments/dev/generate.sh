#!/usr/bin/env bash

set -e

cd ../..
ROOT="$(pwd)"
cd -

MANIFESTS="-f ${ROOT}/profile/default-profile.yaml"
MANIFESTS="${MANIFESTS} -f ${ROOT}/profile/overlays/enable-ingress-sds.yaml"
MANIFESTS="${MANIFESTS} -f ${ROOT}/profile/overlays/enable-egress.yaml"
MANIFESTS="${MANIFESTS} -f ${ROOT}/profile/overlays/enable-sidecar-injector.yaml"
MANIFESTS="${MANIFESTS} -f ${ROOT}/profile/overlays/enable-tracing.yaml"
MANIFESTS="${MANIFESTS} -f ${ROOT}/profile/overlays/enable-kiali.yaml"
MANIFESTS="${MANIFESTS} -f ${ROOT}/profile/overlays/enable-grafana.yaml"

istioctl manifest generate $MANIFESTS > install.yaml

istioctl version --remote=false > last_istioctl_version.txt
echo "$(date -u)" >> last_istioctl_version.txt
