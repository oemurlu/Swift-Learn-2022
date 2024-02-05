//
//  testingExampleTests.swift
//  testingExampleTests
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import XCTest
@testable import testingExample

final class testingExampleTests: XCTestCase {
    
    var viewModel: PeopleViewModel!
    
    override func setUp() {
        super.setUp()
        
        //Given
        viewModel = PeopleViewModel(people: MockData.people)
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testFirstNameFilter() {
        // Given
        // This field is empty bcs i already wrote to given state in setUp func.
        
        // When
        viewModel.filters = [{ $0.firstName == "Alex" }]
        
        // Then
        let expectedResult = [
            Person(firstName: "Alex", lastName: "Black", age: 28, hasDriverLicense: false),
            Person(firstName: "Alex", lastName: "Johnson", age: 32, hasDriverLicense: true)
        ]
        
        XCTAssertEqual(viewModel.peopleMatchingFilters, expectedResult)
        XCTAssertEqual(viewModel.peopleMatchingFilters.count, 2)
    }
    
    func testMultipleFilters() {
        // Given
        
        // When
        viewModel.filters = [
            { $0.firstName == "Alex" },
            { $0.hasDriverLicense == true }
        ]
        
        // Then
        let expectedResult = [
            Person(firstName: "Alex", lastName: "Johnson", age: 32, hasDriverLicense: true)
        ]
        
        XCTAssertEqual(viewModel.peopleMatchingFilters, expectedResult)
    }
    
    func testNoResultFilters() {
        // Given
        
        // When
        viewModel.filters = [
            { $0.firstName == "ASDASD" },
            { $0.hasDriverLicense == true }
        ]
        
        // Then
        let expectedResult: [Person] = []
        
        XCTAssertEqual(viewModel.peopleMatchingFilters, expectedResult)
        
        
    }
    
}
