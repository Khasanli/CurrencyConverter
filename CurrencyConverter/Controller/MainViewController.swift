//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit

class MainViewController: UIViewController {
    private let ConvertorButton = CustomButton(title: "Convert Currencies", image: UIImage(named: "convert"))
    private let CompareCurrenciesButton = CustomButton(title: "Compare Currencies", image: UIImage(systemName: "coloncurrencysign.circle"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.bg_color
        setView()
    }
    
    private func setView(){
        view.addSubview(ConvertorButton)
        ConvertorButton.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ConvertorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ConvertorButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        ConvertorButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ConvertorButton.action = currencyButtonTapped
        
        view.addSubview(CompareCurrenciesButton)
        CompareCurrenciesButton.topAnchor.constraint(equalTo: ConvertorButton.bottomAnchor, constant: 10).isActive = true
        CompareCurrenciesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        CompareCurrenciesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        CompareCurrenciesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CompareCurrenciesButton.action = compareCurrencyButtonTapped
        
    }
    
    private func currencyButtonTapped(){
        let vc = CurrencyViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
    private func compareCurrencyButtonTapped(){
        let vc = CompareCurrenciesViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
}

