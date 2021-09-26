//
//  CustomTextField.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit

class CustomTextField: UITextField {
    private let placeholderText: String
    private let line: Bool
    let TextField : UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    private let bottomLine : UIView = {
        let layer = UIView()
        layer.translatesAutoresizingMaskIntoConstraints = false
        return layer
    }()

    init(placeholderText: String, line: Bool) {
        self.placeholderText = placeholderText
        self.line = line
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        setView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setView(){
        addSubview(TextField)
        if line == false {
            TextField.tintColor = Colors.button_tint_color
            TextField.textColor = Colors.button_tint_color
            TextField.backgroundColor = Colors.button_bg_color
            TextField.layer.cornerRadius = 5
            TextField.leftViewMode = .always
            TextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            TextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            TextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            TextField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            TextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: Colors.button_highlighted_color!])

        } else {
            TextField.tintColor = Colors.button_bg_color
            TextField.textColor = Colors.button_bg_color
            TextField.backgroundColor = .clear
            TextField.leftViewMode = .never
            
            TextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            TextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            TextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            TextField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            TextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: Colors.button_bg_color!])
            
            TextField.addSubview(bottomLine)
            bottomLine.backgroundColor = Colors.button_bg_color
            bottomLine.bottomAnchor.constraint(equalTo: TextField.bottomAnchor).isActive = true
            bottomLine.centerXAnchor.constraint(equalTo: TextField.centerXAnchor).isActive = true
            bottomLine.widthAnchor.constraint(equalTo: TextField.widthAnchor).isActive = true
            bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }
}
