#
#  Be sure to run `pod spec lint hookCrash.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name = 'hookCrash'
s.version = '1.0.0'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = '拦截崩溃信息'
s.homepage = 'https://github.com/zzuzhs/hookCrash'
s.authors = { 'zhs' => 'zshao6112@126.com' }
s.source = { :git => 'https://github.com/zzuzhs/hookCrash.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'hookCrash/hookCrash/*.{h,m}'

end
