# ICInputAccessory

Customized text fields used in the [iCook app](https://itunes.apple.com/app/id554065086).
Try <https://testflight.icook.tw>.

[![Build Status](https://travis-ci.org/polydice/ICInputAccessory.svg)](https://travis-ci.org/polydice/ICInputAccessory)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ICInputAccessory.svg)](https://cocoapods.org/pods/ICInputAccessory)
![Platform](https://img.shields.io/cocoapods/p/ICInputAccessory.svg)
[![CocoaDocs](https://img.shields.io/cocoapods/metrics/doc-percent/ICInputAccessory.svg)](http://cocoadocs.org/docsets/ICInputAccessory/)
![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg)

### ICKeyboardDismissTextField

* A text field that has a button to dismiss keyboard on the input accessory view.

### ICTokenField

* A horizontal scrolling UI that groups input texts.
* Easy to add, select and delete tokens.
* Customizable icon and colors.
* Supports storyboard.

![ICTokenField](https://polydice.github.io/ICInputAccessory/screenshots/ICTokenField.gif)

## Requirements

ICInputAccessory | iOS  | Xcode | Swift
---------------- | :--: | :---: | -----
`~> 1.0.0`       | 8.0+ | 7.2   | ![Swift 2.1.1](https://img.shields.io/badge/Swift-2.1.1-orange.svg)
`~> 1.1.0`       | 8.0+ | 7.3   | ![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg)
`~> 1.2.0`       | 8.0+ | 8.0   | ![Swift 2.3](https://img.shields.io/badge/Swift-2.3-orange.svg)
`develop`        | 8.0+ | 8.0   | ![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg)

## Installation

### Install via [Carthage](https://github.com/Carthage/Carthage)

* Create a `Cartfile` with the following specification and run `carthage update`.

  ```
  github "polydice/ICInputAccessory"
  ```

* Follow the [instruction](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add the framework to an iOS project.

### Install via [CocoaPods](http://guides.cocoapods.org/)

* **ICInputAccessory** supports subspecs. Create a `Podfile` with the following specification and run `pod install`.

  ```rb
  platform :ios, '8.0'
  use_frameworks!

  pod 'ICInputAccessory/TokenField'
  pod 'ICInputAccessory/KeyboardDismissTextField'
  ```

### Install Manually

* Everything you need resides in the `Source` directory. Drag those files to a project.

## Usage

### ICKeyboardDismissTextField

```swift
let textField = ICKeyboardDismissTextField(frame: rect)
```

### ICTokenField

```swift
let tokenField = ICTokenField(frame: rect)
tokenField.delegate = self as? ICTokenFieldDelegate
```

* The characters that completes a token:

```swift
/// Characters that completes a new token, defaults are whitespace and commas.
public var delimiters: [String]
```

* Tokens:

```swift
/// Texts of each created token.
public var texts: [String] { get }

/// Creates a token with the current input text.
public func completeCurrentInputText()

/// Removes the input text and all displayed tokens.
public func resetTokens()
```

* UI customization:

```swift
/// The image on the left of text field.
public var icon: UIImage? { get set }

/// The placeholder with the default color and font.
public var placeholder: String? { get set }

/// The placeholder with customized attributes.
public var attributedPlaceholder: NSAttributedString? { get set }

/// Customized attributes for tokens in the normal state, e.g. NSFontAttributeName and NSForegroundColorAttributeName.
public var normalTokenAttributes: [String : NSObject]? { get set }

/// Customized attributes for tokens in the highlighted state.
public var highlightedTokenAttributes: [String : NSObject]? { get set }
```

* Customizable properties in storyboard:

```swift
@IBInspectable var icon: UIImage?
@IBInspectable var placeholder: String?
@IBInspectable var textColor: UIColor?
@IBInspectable var cornerRadius: CGFloat
```

See `Example/CustomizedTokenField.swift` for more details.

#### ICTokenFieldDelegate

`ICTokenField` currently notifies its delegate the following events:

* `tokenFieldDidBeginEditing(_:)`
* `tokenFieldDidEndEditing(_:)`
* `tokenFieldWillReturn(_:)`
* `tokenField(_:didEnterText:)`
* `tokenField(_:didDeleteText:atIndex:)`

## Development

* Meke sure [Homebrew](http://brew.sh/) is installed.
* Current `develop` branch requires Ruby `2.3.1`.
* Set up dependencies by running the following command in the project root:

  ```
make setup
```

* Open **ICInputAccessory.xcworkspace** and run the demo app with the `Example` scheme.

* See more tasks for building and testing:

  ```
rake -T
```

## Contributing

Thank you for being interested in contributing to this project. We'd love to hear your ideas!

Please fork this repository, create a branch named like `feature/some-new-feature` and send us a pull request to make this project better.

## Contact

[![Twitter](https://img.shields.io/badge/twitter-@polydice-blue.svg?style=flat)](https://twitter.com/polydice)
[![Join the chat at https://gitter.im/polydice/ICInputAccessory](https://badges.gitter.im/polydice/ICInputAccessory.svg)](https://gitter.im/polydice/ICInputAccessory)

## License

Copyright (c) 2016 [Polydice, Inc.](https://polydice.com)

**ICInputAccessory** is released under the MIT license. See [LICENSE](https://github.com/polydice/ICInputAccessory/blob/master/LICENSE) for details.
