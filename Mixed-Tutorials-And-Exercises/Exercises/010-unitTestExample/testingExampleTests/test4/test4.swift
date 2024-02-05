//
//  test4.swift
//  testingExampleTests
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import XCTest

final class test4: XCTestCase {
    
    
    func test_assertionIsEqualWithDescription() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 1
        
        // Then (Beklenen)
        XCTAssertEqual(justANumber, 5, "Expected 5, found \(justANumber)")
    }
    
    func test_assertionIsTrue() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 1
        
        // Then (Beklenen)
        XCTAssertTrue(justANumber == 2)
    }
    
    
    func test_assertionIsNil() {
        // Given (Verilen)
        var justANumber : Int? = 1
        
        // When (Eylem)
        justANumber = nil
        
        // Then (Beklenen)
        XCTAssertNil(justANumber)
    }
    
    func test_assertionIsNotNil() {
        // Given (Verilen)
        var justANumber : Int?
        
        // When (Eylem)
        justANumber = 1
        
        // Then (Beklenen)
        XCTAssertNotNil(justANumber)
    }
    
    func test_assertionIsEqual() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 1
        
        // Then (Beklenen)
        XCTAssertEqual(justANumber, 2)
    }
    
}
