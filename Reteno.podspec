Pod::Spec.new do |s|
  s.name         = 'Reteno'
  s.version      = '0.1.0'
  s.summary      = 'The Reteno iOS SDK for App Analytics and Engagement.'
  s.homepage     = 'https://github.com/reteno-com/reteno-mobile-ios-sdk'
  s.license      = { type: 'MIT', file: 'License' }
  s.authors      = { 'Reteno': 'mobile-sdk@reteno.com' }
  s.source       = { git: 'https://github.com/reteno-com/reteno-mobile-ios-sdk.git', tag: s.version }
  s.frameworks = 'Foundation'
  s.ios.deployment_target = '12.0'
  s.source_files = 'Reteno/Sources/**/*'

  s.swift_versions = ['5']

  s.dependency 'Alamofire', '5.6.2'

end
