//
//  CompareCurrenciesViewController.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 20.09.21.
//

import UIKit
import PromiseKit

class CompareCurrenciesViewController: UIViewController {
    private let currencyVM = CurrencyVM()
    private var currentCurrencies : [Currency] = []
    private var previousCurrencies : [Currency] = []
    
    private let BackButton = UIButton(image: UIImage(systemName: "chevron.backward"), title: nil, tintColor: Colors.tint_color!, backgroundColor: .clear)
    private let Title = UILabel(text: "Compare", backgroundColor: .clear, textColor: Colors.tint_color!, font: UIFont(name: "Arial", size: 15)!)
    private var compareCurrenciesTableView : GenericCompareTableView<CompareCurrenciesCell, Currency>!
    private let Spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.bg_color
        setView()
        Spinner.startAnimating()

        firstly {
            currencyVM.getCurrentCurrencies()
        }.done { currencies in
            self.currentCurrencies = currencies
            print(self.currentCurrencies)
        }.then{
            self.currencyVM.getPreviousCurrencies()
        }.done{ previousCurrencies in
            self.previousCurrencies = previousCurrencies
            self.compareCurrenciesTableView.reloadData()

        }.done{
            self.compareCurrenciesTableView.reloadData()
            self.Spinner.stopAnimating()
        }.catch { error in
           
        }
    }
    private func setView(){
        view.addSubview(BackButton)
        BackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        BackButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        BackButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        BackButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        BackButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(Title)
        Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        Title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Title.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        Title.heightAnchor.constraint(equalToConstant: 30).isActive = true
         
        compareCurrenciesTableView = GenericCompareTableView(items_1: currentCurrencies, items_2: previousCurrencies, cellHeight: 40)
        view.addSubview(compareCurrenciesTableView)
        compareCurrenciesTableView.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 10).isActive = true
        compareCurrenciesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        compareCurrenciesTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        compareCurrenciesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        Spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Spinner)
        Spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        Spinner.hidesWhenStopped = true
    }
    
    @objc private func backButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}
