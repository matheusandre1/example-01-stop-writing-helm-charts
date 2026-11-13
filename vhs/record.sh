#!/usr/bin/env bash
# Records a tape with the VHS Docker image, reusing the host's helm, kubectl and kubeconfig.
# Usage: vhs/record.sh vhs/validate.tape
set -euo pipefail

docker run --rm --network host \
  -v "$PWD":/vhs \
  -v "$(command -v helm)":/usr/local/bin/helm:ro \
  -v "$(command -v kubectl)":/usr/local/bin/kubectl:ro \
  -v "$HOME/.kube":/root/.kube:ro \
  -v "$HOME/.minikube":"$HOME/.minikube":ro \
  ghcr.io/charmbracelet/vhs "$1"

# The container runs as root; hand the output back to the current user.
docker run --rm -v "$PWD":/vhs --entrypoint chown ghcr.io/charmbracelet/vhs -R "$(id -u):$(id -g)" /vhs/vhs
