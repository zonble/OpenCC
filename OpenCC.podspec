Pod::Spec.new do |s|
  s.name = "OpenCC"
  s.version = "0.1.7"
  s.summary = "Open Chinese Convert"
  s.description = <<-DESC
The Pod spec wraps OpeCC (Open Chinese Convert) that helps you to convert Traditianl Chinese
to Simplified Chinese, and vise versa.
                       DESC

  s.homepage = "https://github.com/zonble/OpenCC"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "zonble" => "zonble@gmail.com" }
  s.source = { :git => "https://github.com/zonble/OpenCC.git", :tag => s.version.to_s, :submodules => true }
  s.social_media_url = "https://twitter.com/zonble"

  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"
  s.vendored_frameworks = "lib/OpenCCBridge.xcframework"

  s.source_files = "SwiftOpenCC/Sources/OpenCC"
  s.preserve_paths = ["SwiftOpenCC/Sources/OpenCCBridge/include"]
  s.xcconfig = {
    "HEADER_SEARCH_PATHS" => "#{File.join(File.dirname(__FILE__), "SwiftOpenCC/Sources/OpenCCBridge/include")} $(PODS_ROOT)/OpenCC/SwiftOpenCC/Sources/OpenCCBridge/include",
    "OTHER_LDFLAGS" => "-ObjC -lc++",
    "OTHER_CFLAGS" => "-fembed-bitcode",
  }
  s.frameworks = "OpenCCBridge"
  s.swift_versions = ["5.0", "5.1", "5.5"]
  s.resource = "SwiftOpenCC/OpenCCDictionary.bundle"
  s.prepare_command = "/bin/sh build.sh"

end
