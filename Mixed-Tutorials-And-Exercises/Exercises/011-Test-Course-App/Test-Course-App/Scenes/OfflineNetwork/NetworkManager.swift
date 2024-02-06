//
//  NetworkManager.swift
//  Test-Course-App
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchCourses(completion: @escaping (Result<[Course], Error>) -> Void)
}

enum NetworkError: Error {
    case decodingError
    case otherError
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses(completion: @escaping (Result<[Course], Error>) -> Void) {
        // JSON string olarak önceden tanımlı veriniz
        let jsonString = """
        [
          {
            "id": 1,
            "name": "Swift",
            "numberOfLessons": 16
          },
          {
            "id": 2,
            "name": "UIKit",
            "numberOfLessons": 32
          },
          {
            "id": 3,
            "name": "SwiftUI",
            "numberOfLessons": 24
          },
          {
            "id": 4,
            "name": "Obj-C",
            "numberOfLessons": 48
          },
          {
            "id": 5,
            "name": "Git Github",
            "numberOfLessons": 8
          }
        ]
        """
        
        // json'u data nesnesine donustur
        guard let jsonData = jsonString.data(using: .utf8) else {
            completion(.failure(NetworkError.otherError))
            return
        }
        
        // json'u decode et
        do {
            let courses = try JSONDecoder().decode([Course].self, from: jsonData)
            completion(.success(courses))
        } catch {
            completion(.failure(NetworkError.decodingError))
        }
    }
}
