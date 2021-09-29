//
//  Extension.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String, backgroundColor: UIColor?, textColor: UIColor, font: UIFont) {
        self.init()
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.leftViewMode = .always
        self.textAlignment = .center
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: textColor])

    }
}
extension UILabel {
    convenience init(text: String, backgroundColor: UIColor?, textColor: UIColor, font: UIFont) {
        self.init()
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.text = text
        self.textAlignment = .center
        if backgroundColor != nil {
            self.textColor = textColor
            self.backgroundColor = backgroundColor
        } else {
            self.textColor = textColor
            self.backgroundColor = .clear
        }
    }
}
extension UIButton {
    convenience init(image: UIImage?, title: String?, tintColor: UIColor, backgroundColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(image, for: .normal)
        self.setTitle(title, for: .normal)
        self.tintColor = tintColor
        if image != nil {
            self.backgroundColor = .clear
        } else {
            self.backgroundColor = backgroundColor
        }
    }
}

extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
    }
}

extension UIImageView {
    convenience init(image: UIImage?) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = image
    }
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
       UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
       UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
       UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
       let colorImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       self.setBackgroundImage(colorImage, for: forState)
    }
}

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)
    }
}


