//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import UIKit
import PromiseKit

class CurrencyViewController: UIViewController {
    private let currencyVM = CurrencyVM()
    private var currentCurrencies : [Currency] = []
    private var SelectedFirstValue: Double?
    private var SelectedSecondValue: Double?
    private let Spinner = UIActivityIndicatorView(style: .large)

//MARK:- Objects
    private let BackButton = CustomButton(title: nil, image: UIImage(systemName: "chevron.backward"))
    private let Title = CustomLabel(labelText: "", bgColor: false)
    
    private var FirstCurrencyTextField = CustomTextField(placeholderText: "---", line: false)
    private var FirstCurrencyAmountTextField = CustomTextField(placeholderText: "Write amount", line: true)
    
    private var SecondCurrencyTextField = CustomTextField(placeholderText: "---", line: false)
    private var SecondCurrencyAmountTextField = CustomTextField(placeholderText: "Write amount", line: true)
    
    private var FirstCurrencyPickerView = UIPickerView()
    private var SecondCurrencyPickerView = UIPickerView()

//MARK:-Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.bg_color

        setView()
        Spinner.startAnimating()
        firstly {
            currencyVM.getCurrentCurrencies()
        }.done { currencies in
            self.currentCurrencies = currencies
        }.done{
            self.FirstCurrencyPickerView.reloadAllComponents()
            self.SecondCurrencyPickerView.reloadAllComponents()
            self.Spinner.stopAnimating()
        }.catch { error in
            
        }
    }

//MARK:-Set subviews
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
        
        view.addSubview(FirstCurrencyTextField)
        FirstCurrencyTextField.topAnchor.constraint(equalTo: BackButton.bottomAnchor, constant: 20).isActive = true
        FirstCurrencyTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        FirstCurrencyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        FirstCurrencyTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        FirstCurrencyTextField.TextField.textAlignment = .center
        FirstCurrencyTextField.TextField.tintColor = .clear
        FirstCurrencyTextField.TextField.inputView = FirstCurrencyPickerView
        
        view.addSubview(FirstCurrencyAmountTextField)
        FirstCurrencyAmountTextField.centerYAnchor.constraint(equalTo: FirstCurrencyTextField.centerYAnchor).isActive = true
        FirstCurrencyAmountTextField.leftAnchor.constraint(equalTo: FirstCurrencyTextField.rightAnchor, constant: 20).isActive = true
        FirstCurrencyAmountTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        FirstCurrencyAmountTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        FirstCurrencyAmountTextField.TextField.keyboardType = .numberPad
        FirstCurrencyAmountTextField.TextField.addTarget(self, action: #selector(firstTextFieldEditingDidChange), for: .editingChanged)
        
        view.addSubview(SecondCurrencyTextField)
        SecondCurrencyTextField.topAnchor.constraint(equalTo: FirstCurrencyTextField.bottomAnchor, constant: 20).isActive = true
        SecondCurrencyTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        SecondCurrencyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        SecondCurrencyTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        SecondCurrencyTextField.TextField.textAlignment = .center
        SecondCurrencyTextField.TextField.tintColor = .clear
        SecondCurrencyTextField.TextField.inputView = SecondCurrencyPickerView
        
        view.addSubview(SecondCurrencyAmountTextField)
        SecondCurrencyAmountTextField.centerYAnchor.constraint(equalTo: SecondCurrencyTextField.centerYAnchor).isActive = true
        SecondCurrencyAmountTextField.leftAnchor.constraint(equalTo: SecondCurrencyTextField.rightAnchor, constant: 20).isActive = true
        SecondCurrencyAmountTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        SecondCurrencyAmountTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        SecondCurrencyAmountTextField.TextField.keyboardType = .numberPad
        SecondCurrencyAmountTextField.TextField.addTarget(self, action: #selector(secondTextFieldEditingDidChange), for: .editingChanged)
        
        Spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Spinner)
        Spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        Spinner.hidesWhenStopped = true
        
        FirstCurrencyPickerView.delegate = self
        FirstCurrencyPickerView.dataSource = self
        
        SecondCurrencyPickerView.delegate = self
        SecondCurrencyPickerView.dataSource = self
        
        FirstCurrencyPickerView.tag = 1
        SecondCurrencyPickerView.tag = 2
        
    }
//MARK:- FUNCTIONS
    @objc func firstTextFieldEditingDidChange(){
        if SelectedFirstValue != nil && SelectedSecondValue != nil && FirstCurrencyAmountTextField.TextField.text?.isEmpty != true  {
                let multipleAmount = Double(SelectedFirstValue!) / Double(SelectedSecondValue!)
                let calculate = Double(FirstCurrencyAmountTextField.TextField.text ?? "0.0")! * Double(multipleAmount)
                SecondCurrencyAmountTextField.TextField.text = String(calculate.clean)
            }else {
                SecondCurrencyAmountTextField.TextField.text = ""
            }
    }
    @objc func secondTextFieldEditingDidChange(){
        if SelectedFirstValue != nil && SelectedSecondValue != nil && SecondCurrencyAmountTextField.TextField.text?.isEmpty != true {
            let multipleAmount = Double(SelectedSecondValue!) / Double(SelectedFirstValue!)
            let calculate = Double(SecondCurrencyAmountTextField.TextField.text ?? "0.0")! * Double(multipleAmount)
            FirstCurrencyAmountTextField.TextField.text = String(calculate.clean)
        } else {
            FirstCurrencyAmountTextField.TextField.text = ""
        }
    }
    private func backButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:-Extension for picker view
extension CurrencyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return currentCurrencies.count
        case 2:
            return currentCurrencies.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return currentCurrencies[row].Name
        case 2:
            return currentCurrencies[row].Name
        default:
            return "Data could not found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            FirstCurrencyTextField.TextField.text = currentCurrencies[row].Name
            SelectedFirstValue = currentCurrencies[row].ValueDouble
            firstTextFieldEditingDidChange()
        case 2:
            SecondCurrencyTextField.TextField.text = currentCurrencies[row].Name
            SelectedSecondValue = currentCurrencies[row].ValueDouble
            firstTextFieldEditingDidChange()
        default:
            FirstCurrencyTextField.TextField.text = "---"
            SecondCurrencyTextField.TextField.text = "---"

        }
    }
}
