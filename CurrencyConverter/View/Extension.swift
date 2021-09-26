//
//  Extension.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit

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
