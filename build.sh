# rm -Rf build

rm -Rf lib
mkdir lib

## iOS

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphoneos -arch armv7 -arch armv7s -arch arm64 -arch arm64e  SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphonesimulator -arch i386 -arch x86_64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

## macOS

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk macosx -arch x86_64  SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

## tvOS

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk appletvos -arch arm64 -arch arm64e SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk appletvsimulator -arch i386 -arch x86_64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

 xcodebuild -create-xcframework \
     -framework build/Release/OpenCCBridge.framework \
     -framework build/Release-iphoneos/OpenCCBridge.framework \
     -framework build/Release-iphonesimulator/OpenCCBridge.framework \
     -framework build/Release-appletvos/OpenCCBridge.framework \
     -framework build/Release-appletvsimulator/OpenCCBridge.framework \
     -output lib/OpenCCBridge.xcframework
