#!/bin/bash
set -ex

export HOME=/test

/go/bin/crane auth login ${HARBOR_REGISTRY} -u ${HARBOR_USER} -p ${HARBOR_PASS} --insecure


echo "pulling image..."
/go/bin/crane pull alpine:latest alpine-latest.tar

echo "pushing image to Harbor registry..."
/go/bin/crane push alpine-latest.tar ${HARBOR_REGISTRY}/${HARBOR_PROJECT}/alpine:latest --insecure

echo "All tests complete!"
