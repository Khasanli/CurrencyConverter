//
//  ParseXMLRequest.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import Foundation

class ParseCurrencyXML: NSObject, XMLParserDelegate {
    private var Code : String = ""
    private var currentCharacters: String = ""
    private var currentCurrency: Currency?
    private let ForeignExchange = "Xarici valyutalar"
    private var currencies: [Currency] = [Currency(NominalDouble: 1.0, Name: "AZN", ValueDouble: 1.0)]

    var getCurrencies : [Currency] {
        get {
            return currencies
        } set {
            currencies = newValue
        }
    }
    
    func parseXML(data: Data) {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "Valute" {
            if let code = attributeDict["Code"]{
                Code = code
            }
        }
        if elementName == "Valute" {
            currentCurrency = Currency()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentCharacters = string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "Nominal" {
            currentCurrency?.NominalDouble = Double(currentCharacters)
        }
        
        if elementName == "Name" {
            currentCurrency?.Name = Code
        }
        
        if elementName == "Value" {
            currentCurrency?.ValueDouble = Double(currentCharacters)
        }
        
        if elementName == "Valute" {
            if currentCurrency?.NominalDouble == nil {
            }else {
                currencies.append(currentCurrency!)
            }
        }
    }
}
