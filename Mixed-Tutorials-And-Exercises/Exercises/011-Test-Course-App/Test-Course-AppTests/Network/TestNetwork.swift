//
//  TestNetwork.swift
//  Test-Course-AppTests
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import XCTest
@testable import Test_Course_App

final class TestNetwork: XCTestCase {
    
    var mockVC: MockViewController!
    var mockService: MockNetwork!
    var viewModel: HomeVM!
    
    override func setUp() {
        super.setUp()
            
        mockVC = MockViewController()
        mockService = MockNetwork()
        viewModel = HomeVM(service: mockService)
        
        viewModel.view = mockVC
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockVC = nil
        mockService = nil
        viewModel = nil
    }

    
    func testFetchCoursesSuccess() {
        mockService.result = .success([Course(id: 1, name: "Swift", numberOfLessons: 16)])
        
        mockService.fetchCourses { result in
            switch result {
            case .success(let courses):
                XCTAssertNotNil(courses)
                XCTAssertEqual(courses.count, 1)
                XCTAssertEqual(courses.first?._name, "Swift")
            case .failure(_):
                XCTFail("expected success, got failure")
            }
        }
    }
    
    func testFetchCoursesFailure() {
        mockService.result = .failure(NetworkError.decodingError)
        
        mockService.fetchCourses { result in
            switch result {
            case .success(_):
                XCTFail("expected fail, got success")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    
}
