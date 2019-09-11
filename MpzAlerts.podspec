Pod::Spec.new do |s|
  s.name             = 'MpzAlerts'
  s.version          = '0.1.0'
  s.summary          = 'Elegant way to show alerts'
  s.homepage         = 'https://github.com/Treinetic/MpzAlerts-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mapalagama93' => 'dev.hasitha@gmail.com' }
  s.source           = { :git => 'https://github.com/Treinetic/MpzAlerts-Swift.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'
  s.source_files = 'MpzAlerts/Classes/**/*'
   s.resource_bundles = {
     'MpzAlerts' => ['MpzAlerts/Assets/*', 'MpzAlerts/Resources/*']
   }
   s.resources = ['MpzAlerts/Resources/**/*', 'MpzAlerts/Assets/**/*']
   s.dependency 'SwiftEntryKit'
end
