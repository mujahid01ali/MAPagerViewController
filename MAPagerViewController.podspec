#
# Be sure to run `pod lib lint MAPagerViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MAPagerViewController'
  s.version          = '0.1.0'
  s.summary          = 'Pager-iOS is a top tab pager to scroll tabs/tap with screen.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'Pager-iOS is a  top tab pager for seamless navigation between different tabs. Boasting a user-friendly interface, it enables effortless tab scrolling and tapping, enhancing the overall user experience. This library empowers developers allowing users to effortlessly switch between different tabs.  Elevate your app navigation with Pager-iOS, simplifying tab interaction and elevating user satisfaction.'
                       DESC

  s.homepage         = 'https://github.com/mujahid01ali/MAPagerViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mujahid01ali' => 'magg2761@gmail.com' }
  s.source           = { :git => 'https://github.com/mujahid01ali/MAPagerViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'MAPagerViewController' => ['MAPagerViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
