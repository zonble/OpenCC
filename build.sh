rm -Rf build

## iOS

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphoneos -arch armv7 -arch armv7s -arch arm64 -arch arm64e  SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphonesimulator -arch i386 -arch x86_64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

rm -rf build/Release-universal
mkdir build/Release-universal
mkdir build/Release-universal/OpenCCBridge.framework

cp build/Release-iphoneos/OpenCCBridge.framework/Info.plist build/Release-universal/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Set CFBundleVersion 1.0.0" build/Release-universal/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set CFBundleShortVersionString 1" build/Release-universal/OpenCCBridge.framework/Info.plist
lipo -create build/Release-iphoneos/OpenCCBridge.framework/OpenCCBridge build/Release-iphonesimulator/OpenCCBridge.framework/OpenCCBridge -output build/Release-universal/OpenCCBridge.framework/OpenCCBridge
rm -rf lib
mkdir lib
mkdir lib/ios
cp -r build/Release-universal/OpenCCBridge.framework lib/ios/.

## macOS

rm -Rf build

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk macosx -arch x86_64  SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
/usr/libexec/Plistbuddy -c "Set CFBundleVersion 1.0.0" build/Release/OpenCCBridge.framework/Resources/Info.plist
/usr/libexec/Plistbuddy -c "Set CFBundleShortVersionString 1" build/Release/OpenCCBridge.framework/Resources/Info.plist

mkdir lib/osx
cp -r build/Release/OpenCCBridge.framework lib/osx/.

## tvOS

rm -Rf build

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk appletvos -arch arm64 -arch arm64e SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1
xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk appletvsimulator -arch i386 -arch x86_64 SYMROOT="../build" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode ONLY_ACTIVE_ARCH=NO 2>&1

mkdir build/Release-universal
mkdir build/Release-universal/OpenCCBridge.framework
cp build/Release-appletvos/OpenCCBridge.framework/Info.plist build/Release-universal/OpenCCBridge.framework/.
/usr/libexec/Plistbuddy -c "Set CFBundleVersion 1.0.0" build/Release-universal/OpenCCBridge.framework/Info.plist
/usr/libexec/Plistbuddy -c "Set CFBundleShortVersionString 1" build/Release-universal/OpenCCBridge.framework/Info.plist
lipo -create build/Release-appletvos/OpenCCBridge.framework/OpenCCBridge build/Release-appletvsimulator/OpenCCBridge.framework/OpenCCBridge -output build/Release-universal/OpenCCBridge.framework/OpenCCBridge

mkdir lib/tvos
cp -r build/Release-universal/OpenCCBridge.framework lib/tvos/.
