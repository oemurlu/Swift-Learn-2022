//
//  UserService.swift
//  Protocol-Oriented-Programming
//
//  Created by Osman Emre Ömürlü on 25.02.2023.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
