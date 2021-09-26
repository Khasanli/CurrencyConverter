//
//  CustomUIView.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 20.09.21.
//

import UIKit

class CustomImageView: UIImageView {
    private var img: UIImage

    private let Image: UIImageView = {
        let buttonImage = UIImageView()
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        return buttonImage
    }()
    
    var setImage : UIImage {
        get{
            return img
        }
        set {
            img = newValue
        }
    }
    
    init(img: UIImage) {
        self.img = img
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setView()
    }
    
    private func setView(){
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.backgroundColor = .clear
        
        Image.tintColor = Colors.button_tint_color
        Image.backgroundColor = Colors.button_bg_color

        Image.image = img.withRenderingMode(.alwaysTemplate)

        if image != nil{
            addSubview(Image)
            Image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            Image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            Image.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            Image.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

