# sparkle-pack-aws-my-server-certificates
SparklePack to auto-detect IAM server certificates.

ACM support will be added soon.

h/t to [techshell](https://github.com/techshell) for this approach.

### Environment variables

The following environment variables must be set in order to use this Sparkle
Pack:

- AWS_REGION
- AWS_DEFAULT_REGION (being deprecated?)
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

### Use Cases

This SparklePack adds a registry entry that uses the AWS SDK to detect IAM
server certificates and returns an array of certificate ARNs.

## Usage

Add the pack to your Gemfile and .sfn:

Gemfile:
```ruby
source 'https://rubygems.org'
gem 'sfn'
gem 'sparkle-pack-aws-aws-my-server-certificates'
```

.sfn:
```ruby
Configuration.new do
  sparkle_pack [ 'sparkle-pack-aws-my-server-certificates' ] ...
end
```

In a SparkleFormation Template/Component/Dynamic:
```ruby
allowed_parameters registry!(:my_iam_server_certificates)
```
