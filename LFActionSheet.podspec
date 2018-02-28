#
#  Be sure to run `pod spec lint LFActionSheet.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LFActionSheet"
  s.version      = "0.0.1"
  s.summary      = "一个仿微信样式的ActionSheet."
  s.description  = <<-DESC
		一个仿微信样式的ActionSheet,包括基本的ActionSheet功能，以及封装好的退出登录ActionSheet和选择图片ActionSheet
                   DESC

  s.homepage     = "https://github.com/LFOpen/LFActionSheet"
  s.license      = "MIT"
  s.author             = { "archerLj" => "lj0011977@163.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/LFOpen/LFActionSheet.git", :tag => "#{s.version}" }
  s.source_files  = "LFActionSheet/LFActionSheet/*.{h,m}"
  s.requires_arc = true

end
