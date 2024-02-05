//
//  Optionals.swift
//  testingExampleTests
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import XCTest

final class Optionals: XCTestCase {

    func testOptional() throws {
        let optionalValue: Int? = 10
        let unwrappedValue = try XCTUnwrap(optionalValue)
        XCTAssertEqual(unwrappedValue, 10)
    }
    
    func testOptional2()throws {
        let optionalValue: Int? = nil
        let unwrappedValue = try XCTUnwrap(optionalValue)
        XCTAssertEqual(unwrappedValue, 10)
    }
    
    func testOptionalBool() throws {
        let optionalBool: Bool? = true
        XCTAssertTrue((optionalBool == true))
    }
    
    

}
