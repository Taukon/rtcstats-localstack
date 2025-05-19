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

Rewrite the key and crt paths in `.env` and enable https.
```
RTCSTATS_KEYPATH=./certs/YOUR_KEY_FILE
RTCSTATS_CERTPATH=./certs/YOUR_CRT_FILE
RTCSTATS_HTTPS=true
```

---
### New environments
Add environments to `custom-environment-variables.yaml` in rtcstats-server
```
server:
    ...
    keyPath: RTCSTATS_KEYPATH
    certPath: RTCSTATS_CERTPATH
    tempPath: RTCSTATS_TEMPPATH
    useHTTPS: RTCSTATS_HTTPS
```

### Endpoint for local DynamoDB and S3
- Add environment to `custom-environment-variables.yaml` in rtcstats-server
```
dynamo:
    ...
    endpoint: AWS_ENDPOINT_URL_DYNAMODB

```

- Add endpoint to [S3Manager.js](https://github.com/jitsi/rtcstats-server/blob/master/src/store/S3Manager.js#L30) in rtcstats-server
```
this.s3bucket = new AWS.S3({
            endpoint: process.env.AWS_ENDPOINT_URL_S3,
            params: {
                Bucket: bucket
            }
        });
```

---
### AWS Service Feature
- [x] S3
- [x] DynamoDB
- [ ] Firehose
- [ ] Secrets Manager (For JaaS Webhook)