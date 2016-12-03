require 'aws-sdk-core'
client = ::Aws::ACM::Client.new
arns = ::Array.new(client.list_certificates.certificate_summary_list.collect(&:certificate_arn))

SfnRegistry.register(:my_acm_server_certificate) do |_filter = ENV['public_domain']|
  arns.collect do |arn|
    arn if client.describe_certificate(certificate_arn: arn).certificate.subject_alternative_names.include?(_filter)
  end.compact.first
end

SfnRegistry.register(:acm_server_certificates) do
  arns
end