#!/bin/bash
set -ex

export HOME=/test

# Copy registry1 auth for skopeo multi-auth
cat /.docker/auth.json > /test/auth.json

# Login to harbor to push

echo "[+] Login to harbor"
skopeo login --tls-verify=false --authfile=/test/auth.json ${HARBOR_REGISTRY} -u ${HARBOR_USER} -p ${HARBOR_PASS}

echo "[+] Copy image from registry1 to Harbor registry..."

skopeo copy --dest-tls-verify=false --authfile=/test/auth.json docker://registry1.dso.mil/ironbank/opensource/alpinelinux/alpine:latest docker://${HARBOR_REGISTRY}/${HARBOR_PROJECT}/alpine:latest

echo "[+] All tests complete!"
