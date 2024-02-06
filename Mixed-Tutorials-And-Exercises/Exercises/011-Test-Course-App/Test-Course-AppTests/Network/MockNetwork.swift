//
//  MockNetwork.swift
//  Test-Course-AppTests
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import Foundation
@testable import Test_Course_App

class MockNetwork: NetworkManagerProtocol {
    
    var result: Result<[Course], Error>?
    
    func fetchCourses(completion: @escaping (Result<[Test_Course_App.Course], Error>) -> Void) {
        if let result = result {
            completion(result)
        }
    }
}
