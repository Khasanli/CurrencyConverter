//
//  EndpointsTest.swift
//  CurrencyConverterTests
//
//  Created by Samir Hasanli on 19.09.21.
//

import XCTest
@testable import CurrencyConverter
class EndpointsTest: XCTestCase {

    func test_enpoints() throws {
        XCTAssertEqual(Endpoints.currentCurrencyEndpoint, "22.09.2021.xml")
        XCTAssertEqual(Endpoints.previousCurrencyEndpoint, "21.09.2021.xml")
    }
    

}
