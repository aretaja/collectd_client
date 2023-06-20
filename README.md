# collectd_client
Collectd docker image. Created for personal needs mainly for collecting data using snmp plugin and send over network to collectd collector instance.

## Setup
1. Build imag
```bash
docker build -t collectd_client .
```

2. Copy and modify for your needs docker-compose.yml

```bash
mkdir -p /opt/my_containers/collectd_client/etc
cp docker-compose.yml /opt/my_containers/collectd_client/
```

3. Setup collectd config in /opt/my_containers/collectd_client/etc directory
See provided `client.conf.example` and `custom_types.db.example` files if you need inspiration.

4. Run docker compose
```bash
docker compose -f /opt/my_containers/collectd_client/docker-compose.yml up -d
```
