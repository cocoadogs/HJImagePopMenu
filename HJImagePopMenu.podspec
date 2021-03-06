#
# Be sure to run `pod lib lint HJImagePopMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HJImagePopMenu'
  s.version          = '0.1.0'
  s.summary          = 'A Wechat Image Picker Pop Menu'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A Wechat Image Picker Pop Menu'

  s.homepage         = 'https://github.com/cocoadogs/HJImagePopMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cocoadogs' => 'cocoadogs@163.com' }
  s.source           = { :git => 'https://github.com/cocoadogs/HJImagePopMenu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HJImagePopMenu/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HJImagePopMenu' => ['HJImagePopMenu/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.dependency 'pop', '~> 1.0.10'
  s.dependency 'ReactiveObjC', '~> 3.1.0'
  s.dependency 'Masonry', '~> 1.1.0'
  
end
