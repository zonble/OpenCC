rm -Rf build

xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphoneos -arch armv7 -arch armv7s -arch arm64 -arch arm64e  SYMROOT="../build"
xcodebuild -project SwiftOpenCC/SwiftyOpenCC.xcodeproj -target OpenCCBridge -sdk iphonesimulator -arch i386 -arch x86_64 SYMROOT="../build"

rm -rf build/Release-universal
mkdir build/Release-universal
mkdir build/Release-universal/OpenCCBridge.framework
cp build/Release-iphoneos/OpenCCBridge.framework/Info.plist build/Release-universal/OpenCCBridge.framework/.
lipo -create build/Release-iphoneos/OpenCCBridge.framework/OpenCCBridge build/Release-iphonesimulator/OpenCCBridge.framework/OpenCCBridge -output build/Release-universal/OpenCCBridge.framework/OpenCCBridge
rm -rf lib
mkdir lib
cp -r build/Release-universal/OpenCCBridge.framework lib/.
