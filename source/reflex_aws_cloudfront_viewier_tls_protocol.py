""" Module for CloudfrontViewerTlsProtocol """

import json
import os

import boto3
from reflex_core import AWSRule


class CloudfrontViewerTlsProtocol(AWSRule):
    """ TODO: A description for your rule """

    # TODO: Instantiate whatever boto3 client you'll need, if any.
    # Example:
    # client = boto3.client("s3")

    viewer_protocol_versions =[
        "TLSv1.2_2018",
        "TLSv1.1_2016",
        "TLSv1_2016",
        "TLSv1",
    ]
    viewer_protocol_versions_allowed =[
        "TLSv1.2_2018",
        "TLSv1.1_2016",
    ]
    viewer_protocol_versions_not_allowed =[
        "TLSv1_2016",
        "TLSv1",
    ]

    def __init__(self, event):
        super().__init__(event)

    def extract_event_data(self, event):
        """ Extract required event data """
        # TODO: Extract any data you need from the triggering event.
        #
        # Example:
        # self.bucket_name = event["detail"]["requestParameters"]["bucketName"]
        self.distribution_id = event["detail"]["responseElements"]["distribution"]["id"]
        self.protocol_version = event["detail"]["responseElements"]["distribution"]["viewerCertificate"]["minimumProtocolVersion"]


    def resource_compliant(self):
        """
        Determine if the resource is compliant with your rule.

        Return True if it is compliant, and False if it is not.
        """
        # TODO: Implement a check for determining if the resource is compliant
        return self.protocol_version in self.viewer_protocol_versions_allowed

    def remediate(self):
        """
        Fix the non-compliant resource so it conforms to the rule
        """
        # TODO (Optional): Fix the non-compliant resource. This only needs to
        # be implemented for rules that remediate non-compliant resources.
        # Purely detective rules can omit this function.
        pass

    def get_remediation_message(self):
        """ Returns a message about the remediation action that occurred """
        # TODO: Provide a human readable message describing what occured. This
        # message is sent in all notifications.
        #
        # Example:
        # return f"The S3 bucket {self.bucket_name} was unencrypted. AES-256 encryption was enabled."
        return f"Cloudfront distribution {self.distribution_id} viewer certificate protocol version of {self.protocol_version} does not meet the the minimum requirements.  Allowed values are {", ".join(self.viewer_protocol_versions_allowed)}."


def lambda_handler(event, _):
    """ Handles the incoming event """
    rule = CloudfrontViewerTlsProtocol(json.loads(event["Records"][0]["body"]))
    rule.run_compliance_rule()
