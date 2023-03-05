//
//  LoginViewModel.swift
//  loginApp-MVVM
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import Foundation

final class LoginViewModel {
    
    var error: ObserVableObject<String?> = ObserVableObject(nil)
    
    func login(username: String, password: String) {
        NetworkService.shared.login(username: username, password: password) { [weak self] success in
            self?.error.value = success ? nil : "Invalid credentials"
            //success var ise error.value = nil olacak. success yok ise error.value = "invalid credentials" olacak.
        }
    }
}
