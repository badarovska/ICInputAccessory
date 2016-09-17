//
//  ICKeyboardDismissAccessoryView.swift
//  iCook
//
//  Created by Ben on 27/08/2015.
//  Copyright (c) 2015 Polydice, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

/// A customized keyboard accessory view with a dismiss button.
@IBDesignable
open class ICKeyboardDismissAccessoryView: UIView {

  /// The background color of the button to dismiss keyboard.
  @IBInspectable public var buttonColor: UIColor = Constants.ButtonColor {
    didSet {
      dismissButton.backgroundColor = buttonColor
    }
  }

  /// The button to dismiss keyboard.
  public private(set) lazy var dismissButton: UIButton = {
    let _button = UIButton()
    let resources = Bundle(for: type(of: self))
    let icon = UIImage(named: "icook-iphone-button-hide-keyboard", in: resources, compatibleWith: nil)
    _button.setImage(icon, for: UIControlState())
    _button.backgroundColor = Constants.ButtonColor
    _button.isExclusiveTouch = true
    _button.layer.cornerRadius = 4
    _button.layer.shouldRasterize = true
    _button.layer.rasterizationScale = UIScreen.main.scale
    return _button
  }()

  private struct Constants {
    static let ButtonColor = UIColor(red:0.21, green:0.2, blue:0.19, alpha:0.5)
    static let EdgePadding = CGFloat(7)
    static let InteractiveSize = CGSize(width: 44, height: 44)
  }

  // MARK: - Initialization

  /// Initializes and returns a newly allocated view object with the specified frame rectangle.
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setUpSubviews()
  }

  /// Returns an object initialized from data in a given unarchiver.
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpSubviews()
  }

  // MARK: - UIView

  open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    for subview in subviews {
      if !subview.isHidden && subview.alpha > 0 &&
          subview.isUserInteractionEnabled &&
          subview.point(inside: convert(point, to: subview), with: event) {
        return true
      }
    }
    return false
  }

  // MARK: - NSKeyValueCoding

  open override func setValue(_ value: Any?, forKey key: String) {
    if let color = value as? UIColor, key == "buttonColor" {
      buttonColor = color
    }
  }

  // MARK: - Private Methods

  private func setUpSubviews() {
    backgroundColor = UIColor.clear

    addSubview(dismissButton)
    dismissButton.translatesAutoresizingMaskIntoConstraints = false

    let views = ["button": dismissButton]
    let metrics = [
      "width": Constants.InteractiveSize.width,
      "height": Constants.InteractiveSize.height,
      "padding": Constants.EdgePadding
    ]

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:[button(width)]-(padding)-|",
      options: [],
      metrics: metrics,
      views: views
    ))
    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:[button(height)]-(padding)-|",
      options: [],
      metrics: metrics,
      views: views
    ))
  }

  // MARK: - Internal Methods

  class func requiredHeight() -> CGFloat {
    return Constants.InteractiveSize.height + Constants.EdgePadding * 2
  }

}
