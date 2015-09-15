Pod::Spec.new do |s|
  s.name         = 'Pingpp'
  s.version      = '2.1.2'
  s.summary      = 'Pingplusplus iOS SDK'
  s.description  = <<-DESC
                   移动应用支付接口。
                   开发者不再需要编写冗长的代码，简单几步就可以使你的应用获得支付功能。
                   让你的移动应用接入支付像大厦接入电力一样简单，方便，和温暖。
                   支持微信支付，公众账号支付，支付宝钱包，百度钱包，银联手机支付。
                   DESC
  s.homepage     = 'https://pingxx.com'
  s.license      = 'COMMERCIAL'
  s.author       = { 'Afon Weng' => 'xufeng.weng@pingxx.com' }
  s.platform     = :ios, '5.1.1'
  s.source       = { :git => 'https://github.com/PingPlusPlus/pingpp-ios.git', :tag => s.version }
  s.requires_arc = true
  s.default_subspec = 'Core', 'Alipay', 'Wx', 'UnionPay', 'Bfb'

  s.subspec 'Core' do |core|
    core.source_files = 'lib/*.h'
    core.public_header_files = 'lib/*.h'
    core.vendored_libraries = 'lib/*.a'
    core.resource = 'lib/*.bundle'
    core.frameworks = 'CFNetwork', 'SystemConfiguration', 'Security'
    core.ios.library = 'c++', 'stdc++', 'z'
    core.xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  end

  s.subspec 'ApplePay' do |applepay|
    applepay.ios.weak_frameworks = 'PassKit'
    applepay.source_files = 'lib/Channels/ApplePay/*.h'
    applepay.public_header_files = 'lib/Channels/ApplePay/*.h'
    applepay.vendored_libraries = 'lib/Channels/ApplePay/*.a'
    applepay.dependency 'Pingpp/Core'
  end

  s.subspec 'Alipay' do |alipay|
    alipay.vendored_libraries = 'lib/Channels/Alipay/*.a'
    alipay.ios.vendored_frameworks = 'lib/Channels/Alipay/AlipaySDK.framework'
    alipay.resource = 'lib/Channels/Alipay/AlipaySDK.bundle'
    alipay.dependency 'Pingpp/Core'
  end

  s.subspec 'Wx' do |wx|
    wx.vendored_libraries = 'lib/Channels/Wx/*.a'
    wx.public_header_files = 'lib/Channels/Wx/*.h'
    wx.ios.library = 'sqlite3'
    wx.dependency 'Pingpp/Core'
  end

  s.subspec 'UnionPay' do |unionpay|
    unionpay.vendored_libraries = 'lib/Channels/UnionPay/*.a'
    unionpay.dependency 'Pingpp/Core'
  end

  s.subspec 'Bfb' do |bfb|
    bfb.frameworks = 'CoreTelephony', 'AddressBook', 'AddressBookUI', 'AudioToolbox', 'CoreAudio', 'CoreGraphics', 'ImageIO', 'MapKit', 'MessageUI', 'MobileCoreServices', 'QuartzCore'
    bfb.source_files = 'lib/Channels/Bfb/Dependencies/**/*.{h,m}'
    bfb.public_header_files = 'lib/Channels/Bfb/Dependencies/**/*.h'
    bfb.resource = 'lib/Channels/Bfb/*.bundle'
    bfb.vendored_libraries = 'lib/Channels/Bfb/**/*.a'
    bfb.dependency 'Pingpp/Core'
  end
end
