# OpenCC Pod Spec

[![Actions Status](https://github.com/zonble/OpenCC/workflows/Build/badge.svg)](https://github.com/zonble/OpenCC/actions)
[![Version](https://img.shields.io/cocoapods/v/OpenCC.svg?style=flat)](https://cocoapods.org/pods/OpenCC)
[![License](https://img.shields.io/cocoapods/l/OpenCC.svg?style=flat)](https://cocoapods.org/pods/OpenCC)
[![Platform](https://img.shields.io/cocoapods/p/OpenCC.svg?style=flat)](https://cocoapods.org/pods/OpenCC)

The project wraps [SwiftyOpenCC](https://github.com/ddddxxx/SwiftyOpenCC) by
[ddddxxx](https://github.com/ddddxxx) into a [CocoaPods](https://cocoapods.org)
spec. You can use Swift Package Manager or Carthage to install SwiftyOpenCC,
however, it does not provide a CocoaPods spec, and I want to make my own life
easier.

## Example

To run the example project, clone the repo, and run `pod install` from the
Example directory first.

## Usage

A quick example:

```swift
import OpenCC

var bundle: Bundle? = {
    let openCCBundle = Bundle(for: ChineseConverter.self)
    guard let resourceUrl = openCCBundle.url(forResource: "OpenCCDictionary", withExtension: "bundle") else {
        return nil
    }
    return Bundle(url: resourceUrl)
}()

let str = "鼠标里面的硅二极管坏了，导致光标分辨率降低。"
let converter = try! ChineseConverter(bundle: bundle!, option: [.traditionalize, .TWStandard, .TWIdiom])
converter.convert(str)
// 滑鼠裡面的矽二極體壞了，導致游標解析度降低。
```

## Requirements

- Latest [Xcode](https://developer.apple.com/xcode/)
- iOS 11 or above.
- macOS 10.13 or above.
- tvOS 11 or above.

## Installation

OpenCC is available through CocoaPods. To install it, simply add the following
line to your Podfile:

```ruby
pod 'OpenCC'
```

## Author

zonble, zonble@gmail.com

## License

OpenCC is available under the MIT license. See the LICENSE file for more info.
