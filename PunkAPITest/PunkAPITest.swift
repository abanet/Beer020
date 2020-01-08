//
//  PunkAPITest.swift
//  PunkAPITest
//
//  Created by Alberto Banet Masa on 08/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import XCTest
@testable import Beer020

class PunkAPITest: XCTestCase {

    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
    }

    override func tearDown() {
        session = nil
        super.tearDown()
    }

    /**
        Test de conectividad a la api
     */
   func testValidCallToiTunesGetsHTTPStatusCode200() {
     let url =
       URL(string: "https://api.punkapi.com/v2/beers?food=taco")
     let promise = expectation(description: "Completion handler invocado")
    var statusCode: Int?
    var responseError: Error?

     let dataTask = session.dataTask(with: url!) { data, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
       }
     dataTask.resume()
     wait(for: [promise], timeout: 5)
    
    XCTAssertNil(responseError)
    XCTAssertEqual(statusCode, 200)
   }

}
