//
//  CustomLabel.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit

class CustomLabel: UILabel {
    private let labelText: String
    private let bgColor: Bool
    private let TextLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    init(labelText: String, bgColor: Bool) {
        self.labelText = labelText
        self.bgColor = bgColor
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setView()
    }
    
    private func setView(){
        addSubview(TextLabel)
        TextLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        TextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        TextLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        TextLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        TextLabel.text = labelText

        if bgColor == true {
            TextLabel.tintColor = Colors.button_tint_color
            TextLabel.textColor = Colors.button_tint_color
            TextLabel.backgroundColor = Colors.button_bg_color
        } else {
            TextLabel.tintColor = Colors.button_bg_color
            TextLabel.textColor = Colors.button_bg_color
            TextLabel.backgroundColor = .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
