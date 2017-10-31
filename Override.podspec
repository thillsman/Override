Pod::Spec.new do |s|
  s.name         = "Override"
  s.version      = "1.0"
  s.summary      = "A micro-library that makes it easy to remotely override values in your iOS apps."
  s.homepage     = "https://github.com/thillsman/Override"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Tyler Hillsman" => "hi@tylerhillsman.com" }
  s.source       = { :git => "https://github.com/thillsman/Override.git", :tag => "#{s.version}" }
  s.source_files = "Source/*.swift"
  s.social_media_url = "https://twitter.com/thillsman"
end
