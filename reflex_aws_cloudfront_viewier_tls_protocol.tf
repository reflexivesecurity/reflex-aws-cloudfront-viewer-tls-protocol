module "reflex_aws_cloudfront_viewier_tls_protocol" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.5.4"
  rule_name        = "CloudfrontTlsVersion"
  rule_description = "A reflex rule to ensure CloudFront distribution viewer certificate protocols meet a minimum TLS version."

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

  function_name   = "CloudfrontTlsVersion"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_cloudfront_viewier_tls_protocol.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
    MODE      = var.mode
  }

  # updateDistribution
#   custom_lambda_policy = <<EOF
# {}
# EOF



  queue_name    = "CloudfrontTlsVersion"
  delay_seconds = 0

  target_id = "CloudfrontTlsVersion"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
