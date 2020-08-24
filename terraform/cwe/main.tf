module "cwe" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe?ref=v2.0.1"
  name        = "CloudfrontViewerTlsProtocol"
  description = "A reflex rule to ensure CloudFront distribution viewer certificate protocols meet a minimum TLS version."

  event_pattern = <<PATTERN
{
  "source": [
    "aws.cloudfront"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "cloudfront.amazonaws.com"
    ],
    "eventName": [
      "UpdateDistribution",
      "CreateDistribution"
    ],
    "responseElements": {
      "distribution": {
        "distributionConfig": {
          "viewerCertificate": {
            "certificateSource": [
              "acm"
            ],
            "minimumProtocolVersion": [
              "TLSv1_2016",
              "TLSv1"
            ]
          }
        }
      }
    }
  }
}
PATTERN

}
