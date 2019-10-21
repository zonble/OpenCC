Pod::Spec.new do |s|
  s.name = "OpenCC"
  s.version = "0.1.0"
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

  s.ios.deployment_target = "8.0"

  s.source_files = "SwiftOpenCC/Sources/OpenCC"
  s.prepare_command = "/bin/sh build.sh"
  s.vendored_frameworks = "lib/OpenCCBridge.framework"
  s.preserve_paths = ["SwiftOpenCC/Sources/OpenCCBridge/include"]
  s.xcconfig = {
    "HEADER_SEARCH_PATHS" => "#{File.join(File.dirname(__FILE__), "SwiftOpenCC/Sources/OpenCCBridge/include")} $(PODS_ROOT)/OpenCC/SwiftOpenCC/Sources/OpenCCBridge/include",
    "OTHER_SWIFT_FLAGS" => "-Xcc -fmodule-map-file=#{File.join(File.dirname(__FILE__), "SwiftOpenCC/Sources/OpenCCBridge/include/module.modulemap")}",
    "OTHER_LDFLAGS" => "-ObjC -lc++",
  }
  s.frameworks = "OpenCCBridge"

  # s.resource_bundles = {
  #   'OpenCC' => ['OpenCC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end