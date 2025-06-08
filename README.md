## rtcstats-server with Localstack


### Setup

- Create `.env` from `env.example` and edit `.env`
```shell
rtcstats-localstack$ cp env.example .env
```

- Edit `./rtc-visualizer/.data/users.json` for rtc-visualizer
```
{
    "XXX": "YYY"
}
```

- Run Docker Compose
```shell
rtcstats-localstack$ docker compose up -f rtcstats.yml -d
```
---

### Use HTTPS

- Move key and crt files to `./rtcstats-server/certs` directory for rtcstats-server
```shell
rtcstats-localstack$ mv YOUR_KEY_FILE ./rtcstats-server/certs
rtcstats-localstack$ mv YOUR_CRT_FILE ./rtcstats-server/certs
```

- Rewrite the key and crt paths in `./rtcstats-server/.env` and enable https.
```
RTCSTATS_KEYPATH=./certs/YOUR_KEY_FILE
RTCSTATS_CERTPATH=./certs/YOUR_CRT_FILE
RTCSTATS_HTTPS=true
```

---
### New environments
- Add environments to [custom-environment-variables.yaml](https://github.com/jitsi/rtcstats-server/blob/master/config/custom-environment-variables.yaml#L3) in rtcstats-server
```
server:
    ...
    keyPath: RTCSTATS_KEYPATH
    certPath: RTCSTATS_CERTPATH
    tempPath: RTCSTATS_TEMPPATH
    useHTTPS: RTCSTATS_HTTPS
```


---
### AWS Service Feature
- [x] S3
- [x] DynamoDB
- [ ] Firehose
- [ ] Secrets Manager (For JaaS Webhook)