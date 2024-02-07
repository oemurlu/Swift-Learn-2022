//
//  UnitTesting.swift
//  testingExampleTests
//
//  Created by Osman Emre Ömürlü on 7.02.2024.
//

import XCTest
@testable import testingExample

final class UnitTesting: XCTestCase {

    var simpleMath: SimpleMath!
    
    override func setUp() {
        simpleMath = SimpleMath()
    }
    
    override func tearDown() {
        simpleMath = nil
    }
    
    func testAddTenWorks() {
        // given
        var expected: Int = 0
        
        // when
        expected = simpleMath.addTen(5)
        
        // then
        XCTAssert(expected == 15)
        XCTAssertTrue(expected == 15)
        XCTAssertEqual(expected, 15)
    }
    
    func testBeDquareSucceeds() {
        // given
        var expected: Int = 0
        
        // when
        expected = simpleMath.beSquare(15)
        
        // then
        XCTAssert(expected == 225)
        XCTAssertTrue(expected == 225)
        XCTAssertEqual(expected, 225)
    }
}
