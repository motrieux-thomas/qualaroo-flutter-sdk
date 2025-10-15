#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint qualaroo_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'qualaroo_flutter_sdk'
  s.version          = '0.0.4'
  s.summary          = 'A Flutter bridge for integrating Qualaroo mobile SDK'
  s.description      = <<-DESC
A Flutter bridge for integrating Qualaroo mobile SDK to your mobile application.
                       DESC
  s.homepage         = 'https://qualaroo.com/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Qualaroo' => 'support@qualaroo.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Qualaroo'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
