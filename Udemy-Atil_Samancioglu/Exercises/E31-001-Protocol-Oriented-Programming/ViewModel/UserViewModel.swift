//
//  UserViewModel.swift
//  Protocol-Oriented-Programming
//
//  Created by Osman Emre Ömürlü on 25.02.2023.
//

import Foundation

protocol UserViewModelProtocol: AnyObject { //AnyObject'e extend etmemiz lazim cunku delegate'yi weak var yapiyoz.
    func updateView(name: String, email: String, username: String)
}

class UserViewModel {
    
    private let userService: UserService
    weak var delegate: UserViewModelProtocol?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.updateView(name: user.name, email: user.email, username: user.email)
            case .failure(_):
                self?.delegate?.updateView(name: "no name", email: "no email", username: "no username")
            }
        }
    }
    
    
}
