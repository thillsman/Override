Pod::Spec.new do |spec|
  spec.name         = 'Override'
  spec.version      = '1.0'
  spec.summary      = 'A micro-library that makes it easy to remotely override values in your iOS apps.'
  spec.homepage     = 'https://github.com/thillsman/Override'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Tyler Hillsman' => 'hi@tylerhillsman.com' }
  spec.source       = { :git => 'https://github.com/thillsman/Override.git', :tag => "#{spec.version}" }
  spec.source_files = 'Source/*.swift'
  spec.social_media_url = 'https://twitter.com/thillsman'
  spec.ios.deployment_target = '10.0'
end
