//
//  DataManager.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 19.09.21.
//

import Foundation
import Alamofire
import PromiseKit

class DataManager {
    let xmlParser = ParseCurrencyXML()
    func parseXMLCurrencies(urlString: String) -> Promise<[Currency]> {
        return Promise{seal in
            let url = URL(string: urlString)!
            getData(url: url) { data in
                self.xmlParser.parseXML(data: data)
                seal.resolve(.fulfilled(self.xmlParser.getCurrencies))
                self.xmlParser.getCurrencies = [Currency(NominalDouble: 1.0, Name: "AZN", ValueDouble: 1.0)]
            }
        }
    }
    func getData(url: URL, completionHandler: @escaping (Data) -> Void){
        URLSession.shared.dataTask(with: url) {(data, response, err) in
            guard let data = data else {return}
            completionHandler(data)
        }.resume()
    }
    
}
