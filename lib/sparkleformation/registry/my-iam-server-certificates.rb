require 'aws-sdk-core'

iam = ::Aws::IAM::Client.new

SfnRegistry.register(:my_iam_server_certificates) do
  iam.list_server_certificates.server_certificate_metadata_list.map(&:arn)
end
