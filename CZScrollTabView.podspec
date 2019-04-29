Pod::Spec.new do |s|
  s.name         = "CZScrollTabView"
  s.version      = "0.0.1"
  s.summary      = "iOS-CZScrollTabView"
  s.description  = "iOS-CZScrollTabView类"
  s.homepage     = "https://github.com/chenzhe555/iOS-CZScrollTabView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "chenzhe555" => "376811578@qq.com" }
  s.source       = { :git => "https://github.com/chenzhe555/iOS-CZScrollTabView.git", :tag => "#{s.version}" }
  s.subspec 'classes' do |one|
      one.source_files = 'CZScrollTabView/classes/*.{h,m}'
  end
  s.platform = :ios, "9.0"
  s.frameworks = "Foundation", "UIKit"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "CZCategorys", ">= 0.0.1"
end
