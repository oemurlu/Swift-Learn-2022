//
//  APIManager.swift
//  Protocol-Oriented-Programming
//
//  Created by Osman Emre Ömürlü on 25.02.2023.
//

import Foundation

/* bunu burada da tutabiliriz ama UserService'ye tasiyalim.
protocol UserService {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
*/

class APIManager: UserService {
    
//    static let shared = APIManager()
//    private init () {}
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).first {
                    //.first ile sadece ilk kullaniciyi alcaz test icin. normal tableView'de filan gostermek icin .first kaldirmamiz lazim. user: [User] dizi seklinde oluyo ya. sonra baska bi diziye append ederdik user'i.
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
}
