# reflex-aws-cloudfront-viewier-tls-protocol

A reflex rule to ensure CloudFront distributions meet a minimum TLS version.

ORIGIN

Choose the minimum SSL protocol for CloudFront to use when it establishes an HTTPS connection to your origin. We recommend that you select the latest protocol that your server supports.

Minimum Origin SSL Protocol:

1. TLSv1.2
2. TLSv1.1
3. TLSv1
4. SSLv3

Viewer

Only applies to custom SSL certificates

1. TLSv1.2_2018
2. TLSv1.1_2016
3. TLSv1_2016
4. TLSv1

Use viewer HTTP/2
HTTP/2, HTTP/1.1, HTTP/1.0
For viewer requests, choose the versions of the HTTP protocol that you want CloudFront to accept. In general, HTTP/2 is faster. CloudFront always forwards requests to the origin using HTTP/1.1.

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
