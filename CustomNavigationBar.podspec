#
# Be sure to run `pod lib lint CustomNavigationBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomNavigationBar'
  s.version          = '0.0.2'
  s.summary          = '自定义导航栏 -> CustomNavigationBar.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO:基于view的自定义导航栏，适应于移动，透明度渐变，等场景随便写点吧
                       DESC

  s.homepage         = 'https://github.com/zhangwei5436/CustomNavigationBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangwei5436' => '825460068@qq.com' }
  s.source           = { :git => 'https://github.com/zhangwei5436/CustomNavigationBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CustomNavigationBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CustomNavigationBar' => ['CustomNavigationBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
