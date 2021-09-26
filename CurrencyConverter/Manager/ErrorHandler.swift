//
//  ErrorHandler.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 22.09.21.
//

import Foundation
enum ErrorHandler : Error, LocalizedError {
    case couldNotParseXml
    case couldNotGetData
    case couldNotPlaceData
    
    static func errorHandling(error: ErrorHandler) -> String {
        switch error {
        case .couldNotGetData:
            return error.localizedDescription
        case .couldNotParseXml:
            return error.localizedDescription
        case .couldNotPlaceData:
            return error.localizedDescription
        }
    }
}


