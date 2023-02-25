//
//  WebService.swift
//  Crypto-List-MVVM
//
//  Created by Osman Emre Ömürlü on 24.02.2023.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                if let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data) {
                    print(cryptoList)
                    completion(cryptoList)
                }
            }
        }.resume()
    }
    
}
