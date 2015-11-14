#
# Be sure to run `pod lib lint AWBanner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AWBanner"
  s.version          = "0.1.0"
  s.summary          = 'An easy, customizable and soft Swift banner notification for iOS applications.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
An easy, customizable and soft banner notification for iOS applications.
AWBanner library provides an easy to use class to show a banner view on the screen ( wherever you want, you can specify the Y origin ).
The banner moves from the Y origin ( default 0, but you can change it 👍) and stays there until the duration you choose elapse ( Personally I choose in general 2.5s ).
To dismiss the banner before the time elapse, the user can tap it.
                       DESC

  s.homepage         = "https://github.com/Aymenworks/AWBanner"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Rebouh Aymen" => "aymenmse@gmail.com" }
  s.source           = { :git => "https://github.com/Aymenworks/AWBanner.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/aymenworks'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/AWBanner.swift'
  s.resource_bundles = {
    'AWBanner' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
