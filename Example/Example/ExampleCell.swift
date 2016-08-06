//
//  ExampleCell.swift
//  Example
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

class ExampleCell: UITableViewCell {

  var showcase: UIView? {
    didSet {
      oldValue?.removeFromSuperview()
      if let displayingView = showcase {
        contentView.addSubview(displayingView)
        displayingView.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 9.0, *) {
          displayingView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
          displayingView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
          displayingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
          displayingView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        } else {
          let views = ["view": displayingView]
          contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: views))
          contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: views))
        }
      }
    }
  }

  // MARK: - UITableViewCell

  override func prepareForReuse() {
    super.prepareForReuse()
    showcase?.removeFromSuperview()
    showcase = nil
    textLabel?.text = nil
    accessoryType = .none
  }

}
