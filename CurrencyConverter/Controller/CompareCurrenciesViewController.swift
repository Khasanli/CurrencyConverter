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
    
    private let BackButton = CustomButton(title: nil, image: UIImage(systemName: "chevron.backward"))
    private let Title = CustomLabel(labelText: "Compare", bgColor: false)
    private var compareCurrenciesTableView : GenericTableView<Currency, CompareCurrenciesCell>!
    private let Spinner = UIActivityIndicatorView(style: .large)
    private let ErrorText = CustomLabel(labelText: "Error", bgColor: true)
    private let BGBlur = CustomButton(title: "", image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.bg_color
        setView()
        Spinner.startAnimating()

        firstly {
            currencyVM.getCurrentCurrencies()
        }.done { currencies in
            self.currentCurrencies = currencies
        }.then{
            self.currencyVM.getPreviousCurrencies()
        }.done{ previousCurrencies in
            self.previousCurrencies = previousCurrencies
        }.done{
            self.compareCurrenciesTableView.reload(data: self.currentCurrencies)
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
        BackButton.action = backButtonTapped
        
        view.addSubview(Title)
        Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        Title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Title.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        Title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        compareCurrenciesTableView = GenericTableView(items: currentCurrencies, cellHeight: 40, config: { (item, cell, index) in
            cell.textLabel?.text = item.Name
            if self.previousCurrencies[index].ValueDouble! > item.ValueDouble! {
                cell.changeImage.image = UIImage(named: "arrowUp")
            } else if self.previousCurrencies[index].ValueDouble! < item.ValueDouble!{
                cell.changeImage.image = UIImage(named: "arrowDown")
            } else {
                cell.changeImage.image = UIImage(named: "minus")
            }
        }, selectedHandler: { item in
            print(item.Name)
        })
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
    
    private func backButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}
