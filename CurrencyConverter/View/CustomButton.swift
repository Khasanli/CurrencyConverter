//
//  CustomButton.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit

class CustomButton: UIButton {
    var action: (() -> ())? {
        didSet {
            removeTarget(self, action: nil, for: .touchUpInside)
            if action != nil {
                addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
            }
        }
    }
        
    @objc func onButton(_ sender: Any) {
        action?()
    }
    
    private let title: String?
    private let image: UIImage?

    private let ButtonText: UILabel = {
        let buttonText = UILabel()
        buttonText.translatesAutoresizingMaskIntoConstraints = false
        buttonText.adjustsFontSizeToFitWidth = true
        buttonText.numberOfLines = 0
        buttonText.textAlignment = .center
        return buttonText
    }()
    
    private let ButtonImage: UIImageView = {
        let buttonImage = UIImageView()
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        return buttonImage
    }()
    
    init(title: String?, image: UIImage?) {
        self.title = title
        self.image = image
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setBackgroundColor(color: Colors.button_highlighted_color!, forState: .highlighted)
        setView()
    }
    
    private func setView(){
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.backgroundColor = Colors.button_bg_color
        
        ButtonImage.tintColor = Colors.button_tint_color
        ButtonText.tintColor = Colors.button_tint_color
        ButtonText.textColor = Colors.button_tint_color

        ButtonImage.backgroundColor = .clear
        ButtonText.backgroundColor = .clear

        ButtonImage.image = image
        ButtonText.text = title
        
        if image != nil && title != nil{
            addSubview(ButtonImage)
            addSubview(ButtonText)
            ButtonImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            ButtonImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
            ButtonImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3).isActive = true
            ButtonImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3).isActive = true
            
            ButtonText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            ButtonText.leftAnchor.constraint(equalTo: ButtonImage.rightAnchor).isActive = true
            ButtonText.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            ButtonText.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        } else if image == nil && title != nil{
            addSubview(ButtonText)
            ButtonText.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            ButtonText.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            ButtonText.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            ButtonText.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        } else {
            addSubview(ButtonImage)
            self.backgroundColor = .clear
            ButtonImage.tintColor = Colors.button_bg_color
            ButtonImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            ButtonImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            ButtonImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            ButtonImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
