//
//  LoginViewModel.swift
//  JuniorLevelArchitecture
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import Foundation

class LoginViewModel {
    func loginUser(email: String, password: String, completion: () -> ()) {
        //call api
        LoginNetwork.shared.login(email: email, password: password) {
            completion()
        }
    }
}
