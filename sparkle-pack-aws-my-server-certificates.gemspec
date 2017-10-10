Gem::Specification.new do |s|
  s.name = 'sparkle-pack-aws-my-server-certificates'
  s.version = '0.0.2'
  s.licenses = ['MIT']
  s.summary = 'AWS My Server Certificates SparklePack'
  s.description = 'SparklePack to detect SSL certificates'
  s.authors = ['Greg Swallow']
  s.email = 'gswallow@indigobio.com'
  s.homepage = 'https://github.com/gswallow/sparkle-pack-aws-my-server-certificates'
  s.files = Dir[ 'lib/sparkleformation/registry/*' ] + %w(sparkle-pack-aws-my-server-certificates.gemspec lib/sparkle-pack-aws-my-server-certificates.rb)
  s.add_runtime_dependency 'aws-sdk-core', '~> 2'
end
