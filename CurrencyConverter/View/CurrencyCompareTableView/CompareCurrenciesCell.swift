//
//  CompareCurrenciesCell.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 20.09.21.
//

import UIKit

class CompareCurrenciesCell: UITableViewCell {    
    var changeImage : UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(changeImage)
        changeImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        changeImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        changeImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2).isActive = true
        changeImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}




