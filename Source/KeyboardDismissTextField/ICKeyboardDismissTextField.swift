//
//  ICKeyboardDismissTextField.swift
//  ICInputAccessory
//
//  Created by Ben on 07/03/2016.
//  Copyright © 2016 Polydice, Inc.
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

/// A text field that has a button to dismiss keyboard on the input accessory view.
@IBDesignable
public class ICKeyboardDismissTextField: UITextField {

  /// The custom input accessory view with a button to dismiss keyboard.
  @IBOutlet public var keyboardAccessoryView: ICKeyboardDismissAccessoryView! {
    didSet {
      if UI_USER_INTERFACE_IDIOM() != .phone { return }
      keyboardAccessoryView.dismissButton.addTarget(self, action: .dismiss, for: .touchUpInside)
      inputAccessoryView = keyboardAccessoryView
    }
  }

  // MARK: - Initialization

  /// Initializes and returns a newly allocated view object with the specified frame rectangle.
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setUpAccessoryView()
  }

  /// Returns an object initialized from data in a given unarchiver.
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpAccessoryView()
  }

  // MARK: - UIResponder

  public override func becomeFirstResponder() -> Bool {
    if UI_USER_INTERFACE_IDIOM() == .phone {
      keyboardAccessoryView.alpha = 1
    }
    return super.becomeFirstResponder()
  }

  @objc fileprivate func dismiss(_ sender: UIButton) {
    resignFirstResponder()
    UIView.animate(withDuration: 0.3) {
      self.keyboardAccessoryView.alpha = 0
    }
  }

  // MARK: - Private Methods

  private func setUpAccessoryView() {
    if keyboardAccessoryView == nil {
      keyboardAccessoryView = ICKeyboardDismissAccessoryView()
    }
  }

}


////////////////////////////////////////////////////////////////////////////////


private extension Selector {
  static let dismiss = #selector(ICKeyboardDismissTextField.dismiss(_:))
}
