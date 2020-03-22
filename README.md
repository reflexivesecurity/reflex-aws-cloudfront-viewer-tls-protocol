# reflex-aws-cloudfront-viewier-tls-protocol

A reflex rule to detect that Cloudfront distribution viewer certificates meet a minimum TLS version.

Viewer Protocols: Only applies to custom SSL certificates (i.e. not cloudfront.net)

1. TLSv1.2_2018
2. TLSv1.1_2016 (Recommended Minimum by AWS)
3. TLSv1_2016
4. TLSv1

## Usage

To use this rule either add it to your `reflex.yaml` configuration file:
```
rules:
  - reflex-aws-cloudfront-viewier-tls-protocol:
      version: latest
```

or add it directly to your Terraform:
```
...

module "reflex-aws-cloudfront-viewier-tls-protocol" {
  source           = "github.com/cloudmitigator/reflex-aws-cloudfront-viewier-tls-protocol"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-cloudfront-viewier-tls-protocol/blob/master/LICENSE)
