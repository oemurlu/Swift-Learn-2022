//
//  LoginNetwork.swift
//  JuniorLevelArchitecture
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import Foundation

/*
 CoreLayerdeki dosyalara boyle her ekrana ozel dosya acarak ulasmak daha saglikli ve temizdir.
 Cunku farkli farkli `scene`lerde her yerde NetworkManager.shared.... diye ulasmak cok temiz degildir.
 Mesela NetworkManager, Alamofire kullaniyor ya projeyi 'Moya'ya veya 'URLSession'a gecirin denildigini dusunelim.
 Bu dosyaya gelip sadece asagidaki NetworkManager yazani artik NetworkManagerURLSession ile degistirdik mi tamamdir :)
 Obur turlu her scenedeki NetworkManager'i tek tek degistirmen lazim NetworkManagerURLSession ile :/
 */

class LoginNetwork {
    static let shared = LoginNetwork()
    
    func login(email: String, password: String, completion: () -> ()) {
        NetworkManager.shared.get(url: NetworkHelper.shared.baseURL + "login",
                                  params: ["email": email, "password": password]) {
            completion()
        }
    }
}
