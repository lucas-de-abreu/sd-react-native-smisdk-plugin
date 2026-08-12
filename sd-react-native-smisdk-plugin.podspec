require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "sd-react-native-smisdk-plugin"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  Datami SMISDK React Native Plugin for sponsored/zero-rated mobile data
                   DESC
  s.homepage     = package["homepage"]
  s.license      = { :type => "Proprietary", :text => "Datami Mobile Solutions" }
  s.authors      = { "Datami Inc" => "support@datami.com" }
  s.platforms    = { :ios => "12.0" }
  s.source       = { :git => package["repository"]["url"], :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,m,swift}"
  s.ios.preserve_paths      = 'ios/libsmisdk.a'
  s.ios.vendored_libraries  = 'ios/libsmisdk.a'
  s.requires_arc = true

  s.dependency "React-Core"
end

