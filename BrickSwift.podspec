#
# Be sure to run `pod lib lint brick-swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BrickSwift'
  s.version          = '0.0.1'
  s.summary          = 'Common tool classes and reactive extensions for swift projects'

  s.description      = <<-DESC
  Common tool classes and reactive extensions for swift projects.
  MVVM
  ...
                       DESC

  s.homepage         = 'https://github.com/anwent/brick-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anwent' => 'zhihaozhanggm@gmail.com' }
  s.source           = { :git => 'https://github.com/anwent/brick-swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.1'

  s.frameworks = 'UIKit'
  s.dependency 'Alamofire'
  s.dependency 'HandyJSON'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  
end
