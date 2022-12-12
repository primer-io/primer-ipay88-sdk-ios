#
# Be sure to run `pod lib lint PrimerIPay88SDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PrimerIPay88SDK'
    s.version          = '0.1.0'
    s.summary          = 'A wrapper of the iPay88 SDK.'
    
    s.description      = <<-DESC
    PrimerIPay88SDK is a wrapper of the iPay88 SDK that exposes its functionality source
    it can be used within the PrimerSDK as a separate module. If you want to use iPay88 for
    accepting payments from Primer you have to add `pod 'PrimerIPay88SDK'` in your podfile.
    DESC
    
    s.homepage         = 'https://github.com/primer-io/primer-ipay88-sdk-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Checkout Team' => 'checkout@primer.io' }
    s.source           = { :git => 'https://github.com/primer-io/primer-ipay88-sdk-ios.git', :tag => s.version.to_s }
    s.social_media_url = 'https://primer.io'
    
    s.cocoapods_version = '>= 1.10.0'
    s.swift_version     = '5.3'
    
    s.ios.deployment_target = '10.0'
    
    s.xcconfig = {
        'CODE_SIGNING_ALLOWED' => 'NO'
    }
    
    s.source_files = 'PrimerIPay88SDK/Classes/**/*', 'PrimerIPay88SDK/Frameworks/iPay88_IOS_SDK_v1.0.6.3_64 Bit/SDK/Ipay.h', 'PrimerIPay88SDK/Frameworks/iPay88_IOS_SDK_v1.0.6.3_64 Bit/SDK/IpayPayment.h'
    
    s.vendored_libraries = 'PrimerIPay88SDK/Frameworks/iPay88_IOS_SDK_v1.0.6.3_64 Bit/SDK/libipay88sdk.a'
end
