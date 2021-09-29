//
//  CurrencyVM.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import Foundation
import PromiseKit

class CurrencyVM {
    private let dataManager = DataManager()

    func getCurrentCurrencies() -> Promise<[Currency]> {
        return Promise{seal in
            firstly {
                dataManager.parseXMLCurrencies(urlString: BaseURL.baseURL+Endpoints.currentCurrencyEndpoint)
            }.done { currencies in
                seal.resolve(.fulfilled(currencies))
            }.catch { error in
                print(ErrorHandler.errorHandling(error: .couldNotParseXml))
            }
        }
    }
    
    func getPreviousCurrencies() -> Promise<[Currency]> {
        return Promise{seal in
            firstly {
                dataManager.parseXMLCurrencies(urlString: BaseURL.baseURL+Endpoints.previousCurrencyEndpoint)
            }.done { currencies in
                seal.resolve(.fulfilled(currencies))
            }.catch { error in
                print(ErrorHandler.errorHandling(error: .couldNotParseXml))
            }
        }
    }
}
