## rtcstats-server with Localstack


### Setup

create users.json for rtc-visualizer
```shell
rtcstats-localstack$ ./user-example.sh
```

Run Docker Compose
```shell
rtcstats-localstack$ docker compose up -d
```
---

### Use HTTPS

Move key and crt files to `rtcstats-server/certs` directory
```shell
rtcstats-localstack$ mv YOUR_KEY_FILE ./rtcstats-server/certs
rtcstats-localstack$ mv YOUR_CRT_FILE ./rtcstats-server/certs
```

Rewrite docker-compose.yml
```
- RTCSTATS_KEYPATH=./rtcstats-server/certs/YOUR_KEY_FILE
- RTCSTATS_CERTPath=./rtcstats-server/certs/YOUR_CRT_FILE
```

---
### AWS Service Feature
- [x] S3
- [x] DynamoDB
- [ ] Firehose
- [ ] Secrets Manager (For JaaS Webhook)