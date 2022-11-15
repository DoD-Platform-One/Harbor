## Deploying Harbor in Production

# Redis
Harbor requires a redis endpoint filled in under `redis.external.addr`. In order to use a fully extensible BigBang and Registry1 owned Redis installation `redis-bb.enabled` is set to true by default to deploy a 1 master 3 replica redis cluster. 

If you wish to utilize a cloud elasticache endpoint, disable `redis-bb.enabled` and set your endpoint in `redis.external.addr`.
