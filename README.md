# PrimerIPay88SDK

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

### Swift Package Manager

Add `https://github.com/primer-io/primer-sdk-ios` to your app with the Exact Version rule, set to the PrimerSDK version that ends in `-3ds-ipay88` (for example `2.53.1-3ds-ipay88`). That version brings in PrimerIPay88MYSDK. Do not add this package next to PrimerSDK yourself, because PrimerSDK may then build without it.

### CocoaPods

Add the Primer spec repo and the CocoaPods CDN at the top of your Podfile, in this order. Then add the pod:

```ruby
source 'https://github.com/primer-io/primer-sdk-ios-specs.git'
source 'https://cdn.cocoapods.org/'

pod 'PrimerIPay88MYSDK'
```

## Author

EvansPie, evangelos@primer.io

## License

PrimerIPay88SDK is available under the MIT license. See the LICENSE file for more info.
