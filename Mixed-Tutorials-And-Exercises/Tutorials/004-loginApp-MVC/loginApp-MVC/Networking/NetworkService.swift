//
//  NetworkService.swift
//  loginApp-MVC
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private var user: User?
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if username == "oemurlu" && password == "asdasd" {
                    self.user = User(name: "osman emre", username: username, age: 21, address: Address(city: "Denizli", country: "Turkey"))
                    completion(true)
                    //artik LoginVC'deki true blogu calisir.
                } else {
                    self.user = nil
                    completion(false)
                }
            }
        }
    }
}
