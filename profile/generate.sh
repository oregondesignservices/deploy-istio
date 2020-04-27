#!/usr/bin/env bash

set -e

istioctl profile dump default > default-profile.yaml

istioctl version --remote=false > last_istioctl_version.txt