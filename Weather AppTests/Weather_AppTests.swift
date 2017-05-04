//
//  Weather_AppTests.swift
//  Weather AppTests
//
//  Created by Kenny Domingo on 03/05/2017.
//  Copyright © 2017 Kenny Domingo. All rights reserved.
//

import XCTest
@testable import Weather_App

class Weather_AppTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    // Asynchronous test: faster fail
    func testCallToiTunesCompletes() {
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast/daily?id=2643743&appid=9ab980154b2797d68656609717cbb4e6")
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?

        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            
            promise.fulfill()
        }
        dataTask.resume()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode!, 200)
    }
    
}
