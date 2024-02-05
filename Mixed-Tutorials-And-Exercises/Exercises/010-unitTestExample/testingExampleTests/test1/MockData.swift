//
//  MockData.swift
//  testingExampleTests
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import Foundation
@testable import testingExample

class MockData {
    static let people: [Person] = [
        Person(firstName: "John", lastName: "Doe", age: 30, hasDriverLicense: true),
        Person(firstName: "Jane", lastName: "Doe", age: 25, hasDriverLicense: false),
        Person(firstName: "Mike", lastName: "Smith", age: 20, hasDriverLicense: true),
        Person(firstName: "Sarah", lastName: "Brown", age: 35, hasDriverLicense: true),
        Person(firstName: "Gary", lastName: "White", age: 40, hasDriverLicense: false),
        Person(firstName: "Lucy", lastName: "Green", age: 22, hasDriverLicense: true),
        Person(firstName: "Alex", lastName: "Black", age: 28, hasDriverLicense: false),
        Person(firstName: "Alex", lastName: "Johnson", age: 32, hasDriverLicense: true),
        Person(firstName: "Noah", lastName: "Williams", age: 19, hasDriverLicense: false),
        Person(firstName: "Emma", lastName: "Jones", age: 45, hasDriverLicense: true)
    ]
}
