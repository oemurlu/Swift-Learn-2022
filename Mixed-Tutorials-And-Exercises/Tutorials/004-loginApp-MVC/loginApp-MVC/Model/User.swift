//
//  User.swift
//  loginApp-MVC
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import Foundation

struct User {
    let name, username: String
    let age: Int
    let address: Address
}

struct Address {
    let city: String
    let country: String
}
