import AWS from 'aws-sdk'

const {
  RTCSTATS_S3_BUCKET,
  AWS_REGION: region,
  RTCSTATS_S3_ENDPOINT: endpoint
} = process.env;

const config = { region };

AWS.config.update(config);

const s3Config = endpoint ? { endpoint } : {};

const bucketConfig = {
    Bucket: RTCSTATS_S3_BUCKET
};

const s3 = new AWS.S3(s3Config);


s3.createBucket(bucketConfig, (err, data) => {
  if (err) {
    console.error('Could not create bucket:', err);
  }
});
