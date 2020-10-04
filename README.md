# reflex-aws-cloudfront-viewier-tls-protocol
A Reflex rule to detect that Cloudfront distribution viewer certificates meet a minimum TLS version.

Viewer Protocols: Only applies to custom SSL certificates (i.e. not cloudfront.net)

1. TLSv1.2_2018
2. TLSv1.1_2016 (Recommended Minimum by AWS)
3. TLSv1_2016
4. TLSv1

To learn more about CloudFront, see [the AWS Documentation](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html).

## Getting Started
To get started using Reflex, check out [the Reflex Documentation](https://docs.cloudmitigator.com/).

## Usage

To use this rule either add it to your `reflex.yaml` configuration file:
```
rules:
  aws:
    - cloudfront-viewier-tls-protocol:
        version: latest
```

or add it directly to your Terraform:
```
module "cloudfront-viewer-tls-protocol" {
  source            = "git::https://github.com/reflexivesecurity/reflex-aws-cloudfront-viewer-tls-protocol.git?ref=latest"
  sns_topic_arn     = module.central-sns-topic.arn
  reflex_kms_key_id = module.reflex-kms-key.key_id
}
```

Note: The `sns_topic_arn` and `reflex_kms_key_id` example values shown here assume you generated resources with `reflex build`. If you are using the Terraform on its own you need to provide your own valid values.

## Configuration
This rule has no configuration options.

## Contributing
If you are interested in contributing, please review [our contribution guide](https://docs.cloudmitigator.com/about/contributing.html).

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/reflexivesecurity/reflex-aws-cloudfront-viewier-tls-protocol/blob/master/LICENSE)
