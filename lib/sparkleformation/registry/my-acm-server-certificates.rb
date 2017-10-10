require 'aws-sdk-core'
client = ::Aws::ACM::Client.new
arns = ::Array.new(client.list_certificates.certificate_summary_list.collect(&:certificate_arn))

# Cloudfront requires ACM certs from us-east-1 only.
east_only = ::Aws::ACM::Client.new(region: 'us-east-1')
east_only_arns = ::Array.new(east_only.list_certificates.certificate_summary_list.collect(&:certificate_arn))

SfnRegistry.register(:my_acm_server_certificate) do |_config = {}|
  if _config.fetch(:east_only, false)
    east_only_arns.collect do |arn|
      arn if east_only.describe_certificate(certificate_arn: arn).certificate.subject_alternative_names.include?(_config.fetch(:filter, ENV['public_domain']))
    end.compact.first
  else
    arns.collect do |arn|
      arn if client.describe_certificate(certificate_arn: arn).certificate.subject_alternative_names.include?(_config.fetch(:filter, ENV['public_domain']))
    end.compact.first
  end
end

SfnRegistry.register(:acm_server_certificates) do |_config = {}|
  if _config.fetch(:east_only, false)
    east_only_arns
  else
    arns
  end
end
