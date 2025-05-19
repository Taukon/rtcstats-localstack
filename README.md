## rtcstats-server with Localstack


### Setup

Create `.env` from `env.example` and edit `.env`
```shell
rtcstats-localstack$ cp env.example .env
```

Edit `.data/users.json` for rtc-visualizer
```
{
    "XXX": "YYY"
}
```

Run Docker Compose
```shell
rtcstats-localstack$ docker compose up -d
```
---

### Use HTTPS

Move key and crt files to `certs` directory for rtcstats-server
```shell
rtcstats-localstack$ mv YOUR_KEY_FILE ./certs
rtcstats-localstack$ mv YOUR_CRT_FILE ./certs
```

Rewrite the key and crt paths in `.env`.
```
RTCSTATS_KEYPATH=./certs/YOUR_KEY_FILE
RTCSTATS_CERTPath=./certs/YOUR_CRT_FILE
```

---
### AWS Service Feature
- [x] S3
- [x] DynamoDB
- [ ] Firehose
- [ ] Secrets Manager (For JaaS Webhook)