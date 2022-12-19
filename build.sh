rm -Rf build
rm -Rf lib
mkdir lib

## iOS

xcodebuild archive -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphoneos -arch arm64 -arch arm64e  SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
xcodebuild archive -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphonesimulator -arch x86_64 -arch arm64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

## macOS

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk macosx -arch x86_64 -arch arm64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

## tvOS

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk appletvos -arch arm64 -arch arm64e SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk appletvsimulator -arch i386 -arch x86_64 -arch arm64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

cp build/Release-appletvos/OpenCCBridge.framework/Info.plist build/Release/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Add :CFBundleVersion string '1.0.0'" build/Release/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set :CFBundleShortVersionString 1.0.0" build/Release/OpenCCBridge.framework/Info.plist

cp build/Release-appletvos/OpenCCBridge.framework/Info.plist build/Release-iphoneos/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Add :CFBundleVersion string '1.0.0'" build/Release-iphoneos/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set :CFBundleShortVersionString 1.0.0" build/Release-iphoneos/OpenCCBridge.framework/Info.plist

cp build/Release-appletvos/OpenCCBridge.framework/Info.plist build/Release-iphonesimulator/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Add :CFBundleVersion string '1.0.0'" build/Release-iphonesimulator/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set :CFBundleShortVersionString 1.0.0" build/Release-iphonesimulator/OpenCCBridge.framework/Info.plist

cp build/Release-appletvos/OpenCCBridge.framework/Info.plist build/Release-appletvos/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Add :CFBundleVersion string '1.0.0'" build/Release-appletvos/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set :CFBundleShortVersionString 1.0.0" build/Release-appletvos/OpenCCBridge.framework/Info.plist

cp build/Release-appletvos/OpenCCBridge.framework/Info.plist build/Release-appletvsimulator/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Add :CFBundleVersion string '1.0.0'" build/Release-appletvsimulator/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set :CFBundleShortVersionString 1.0.0" build/Release-appletvsimulator/OpenCCBridge.framework/Info.plist


xcodebuild -create-xcframework \
     -framework build/Release/OpenCCBridge.framework \
     -framework build/UninstalledProducts/iphoneos/OpenCCBridge.framework \
     -framework build/UninstalledProducts/iphonesimulator/OpenCCBridge.framework \
     -framework build/Release-appletvos/OpenCCBridge.framework \
     -framework build/Release-appletvsimulator/OpenCCBridge.framework \
     -output lib/OpenCCBridge.xcframework
