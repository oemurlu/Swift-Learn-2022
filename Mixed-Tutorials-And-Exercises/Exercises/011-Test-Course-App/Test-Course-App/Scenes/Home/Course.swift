//
//  Course.swift
//  Test-Course-App
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import Foundation

struct Course: Codable {
    let id: Int?
    let name: String?
    let numberOfLessons: Int?
    
    var _id: Int {
        id ?? UUID().hashValue
    }
    
    var _name: String {
        name ?? "N/A"
    }
    
    var _numberOfLessons: Int {
        numberOfLessons ?? 0
    }
}

