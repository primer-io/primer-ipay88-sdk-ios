#
# Be sure to run `pod lib lint PrimerIPay88SDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PrimerIPay88MYSDK'
    s.version          = '0.1.7'
    s.summary          = 'Primer\'s wrapper of the iPay88\'s Malaysian SDK.'
    
    s.description      = <<-DESC
    PrimerIPay88MYSDK is a wrapper of iPay88's Malaysian SDK that exposes its functionality, and It can
    be used within the PrimerSDK as a separate module. If you want to use iPay88 for
    accepting payments in Malaysia with Primer you have to add `pod 'PrimerIPay88MYSDK'` in your podfile.
    DESC
    
    s.homepage         = 'https://github.com/primer-io/primer-ipay88-sdk-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Checkout Team' => 'checkout@primer.io' }
    s.source           = { :git => 'https://github.com/primer-io/primer-ipay88-sdk-ios.git', :tag => s.version.to_s }
    s.social_media_url = 'https://primer.io'
    
    s.cocoapods_version = '>= 1.10.0'
    s.swift_version     = '5.3'
    
    s.ios.deployment_target = '10.0'
    
    s.source_files = 'PrimerIPay88SDK/Classes/**/*', 'PrimerIPay88SDK/Frameworks/Ipay.h', 'PrimerIPay88SDK/Frameworks/IpayPayment.h', 'PrimerIPay88SDK/Frameworks/libipay88sdk.xcframework'
    s.vendored_frameworks = 'PrimerIPay88SDK/Frameworks/libipay88sdk.xcframework'
end
