//
//  TestHome.swift
//  Test-Course-AppTests
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import XCTest
@testable import Test_Course_App

final class TestHome: XCTestCase {

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
    
    func testHomeVMViewDidLoadCallConfigureMethods() {
        viewModel.viewDidLoad()
        
        XCTAssertTrue(mockVC.isConfigureVCCalled)
        XCTAssertTrue(mockVC.isConfigureTableViewCalled)
    }
    
    func testHomeVMFetchCoursesSucessCallsReloadTableViewOnMain() {
        mockService.result = .success([Course(id: 1, name: "Swift", numberOfLessons: 16)])
        
        viewModel.fetchCourses()
        
        XCTAssertTrue(mockVC.isReloadTableViewCalled)
    }
    
    func testHomeVMFetchCoursesFailureCallsReloadTableViewOnMain() {
        mockService.result = .failure(NetworkError.otherError)
        
        viewModel.fetchCourses()
        
        XCTAssertFalse(mockVC.isReloadTableViewCalled)
    }
    
    func testCourseCellConfigurationWithLessThan30Lessons() {
        let course = Course(id: 1, name: "Swift", numberOfLessons: 16)
        
        let cell = CourseCell(style: .default, reuseIdentifier: CourseCell.reuseID)
        cell.setCell(course: course)
        
        XCTAssertEqual(cell.nameLabel.text, course._name, "Name label text should match the course name")
        XCTAssertEqual(cell.detailLabel.text, "Lessons: \(course._numberOfLessons)", "Detail label text should correctly display the number of lessons")
    }
    
    func testCourseCellConfigurationWith30OrMoreLessons() {
        let course = Course(id: 2, name: "Obj-C", numberOfLessons: 32)
        
        let cell = CourseCell(style: .default, reuseIdentifier: CourseCell.reuseID)
        cell.setCell(course: course)
        
        XCTAssertEqual(cell.nameLabel.text, course._name, "Name label text should match the course name")
        XCTAssertEqual(cell.detailLabel.text, "Lessons 30+ Check it out!", "Detail label text should encourage checking out courses with 30 or more lessons")
    }


}
