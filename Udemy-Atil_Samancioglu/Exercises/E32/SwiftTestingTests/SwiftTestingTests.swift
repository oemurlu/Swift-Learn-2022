//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Osman Emre Ömürlü on 4.02.2024.
//

import XCTest
@testable import SwiftTesting

final class SwiftTestingTests: XCTestCase {
    
    var mathematicFunctions: MathematicFunctions!
    
    override func setUp() {
        super.setUp()
        
        //        mathematicFunctions = MathematicFunctions()
        mathematicFunctions = .init()
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        mathematicFunctions = nil
        print("tearDown")
    }
    
    func test_Add_Integers() {
        let result = mathematicFunctions.addIntegers(x: 5, y: 3)
        XCTAssertEqual(result, 8)
    }
    
    func test_multiply_Integers() {
        let result = mathematicFunctions.multiplyIntegers(x: 5, y: 3)
        XCTAssertEqual(result, 15)
    }
    
    func test_Divide_Integers() {
        let result = mathematicFunctions.divideIntegers(x: 6, y: 3)
        XCTAssertEqual(result, 2)
    }
    
    func test_Divide_Integer_By_Zero() {
        let result = mathematicFunctions.divideIntegers(x: 10, y: 0)
        XCTAssertNil(result, "The divideIntegers method should return nil when attempting to divide by zero")
    }
    
}
