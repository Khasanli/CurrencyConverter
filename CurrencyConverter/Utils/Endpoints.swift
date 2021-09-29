//
//  Endpoints.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import Foundation

class Endpoints {
    static var currentCurrencyEndpoint : String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter.string(from: Date()) + ".xml"
        }
    }
    
    static var previousCurrencyEndpoint : String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!) + ".xml"
        }
    }
}
