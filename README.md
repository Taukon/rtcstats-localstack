## rtcstats-server with Localstack


1. ### setup
```shell
rtcstats-localstack$ docker compose up -d
```

- access rtcstats container's shell
```shell
/rtcstats/rtcstats-server# npm install
/rtcstats/rtcstats-server# npm run init:s3
/rtcstats/rtcstats-server# npm run init:dynamodb
```
---

2. ### start rtcstats-server
- access rtcstats container's shell
```shell
/rtcstats/rtcstats-server# npm run start
```

---
3. ### start rtc-visualizer
- access rtcstats container's shell
```shell
/rtcstats/rtc-visualizer# npm run start
```

---
### AWS Service Feature
- [x] S3
- [x] DynamoDB
- [ ] Firehose
- [ ] Secrets Manager (For JaaS Webhook)