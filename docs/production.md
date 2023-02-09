## Deploying Harbor in Production

# Redis
Harbor requires a redis endpoint filled in under `redis.external.addr`. In order to use a fully extensible BigBang and Registry1 owned Redis installation `redis-bb.enabled` is set to true by default to deploy a 1 master 3 replica redis cluster.

If you wish to utilize a cloud elasticache endpoint, disable `redis-bb.enabled` and set your endpoint in `redis.external.addr`.

# RSA Certificate for Token Signatures
Harbor requires an RSA key/certificate pair be generated and supplied as a secret to the Harbor core and exporter components.  This RSA keypair is used to sign JWTs retrieved from the Harbor API at the `/service/token` endpoint.  Therefore, it is **critical** to keep the RSA key used to sign these tokens confidential.

## Key generation
```bash
# Generate the RSA key with length 4096
openssl genrsa -out secret.key 4096

# Generate the configuration used when generating the certificate
# Replace with configuration appropriate for your organization
cat <<EOF> conf
[req]
distinguished_name=dn
[ dn ]
[ ext ]
basicConstraints=CA:TRUE
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer
EOF

# Generate the certificate from the private key and configuration
# Replace with configuration appropriate for your organization
openssl req \
-key secret.key \
-config conf \
-nodes \
-new \
-subj "/"
-x509
-days 365
-extensions ext
-out cert.crt
```

## Usage with chart
You may use these certificates with this helm chart in one of two ways:

1. You can populate the `core.tokenKey` and `core.tokenCertificate` fields with the content of the files created above
2. You can create a secret yourself independently of the chart and reference it with `core.secretName`
