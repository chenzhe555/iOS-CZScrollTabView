Pod::Spec.new do |s|
  s.name         = "CZScrollTabView"
  s.version      = "0.0.1"
  s.summary      = "iOS-ScrollTabView"
  s.description  = "iOS-ScrollTab视图"
  s.homepage     = "https://github.com/chenzhe555/iOS-CZScrollTabView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "chenzhe555" => "376811578@qq.com" }
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/chenzhe555/iOS-CZScrollTabView.git", :tag => "#{s.version}" }
  s.subspec 'CZScrollTabView' do |one|
      one.source_files = 'CZScrollTabView/classes/*.{h,m}'
  end
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
