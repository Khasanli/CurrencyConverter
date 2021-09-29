//
//  CompareCurrenciesCell.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 20.09.21.
//

import UIKit

class CompareCurrenciesCell: GenericCompareCell<Currency> {
    private var changeImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }

    override var item1: Currency! {
        didSet {
            textLabel?.text = item1.Name
            if item1.ValueDouble ?? 0.0 > item2.ValueDouble ?? 0.0 {
                changeImage.image = UIImage(named: "arrowUp")
            } else if item1.ValueDouble ?? 0.0 < item2.ValueDouble ?? 0.0 {
                changeImage.image = UIImage(named: "arrowDown")
            } else {
                changeImage.image = UIImage(named: "minus")
            }
        }
    }
    func setView() {
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




