//
//  NetworkManager.swift
//  JuniorLevelArchitecture
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    // jr seviye icin boyle ayri ayri yazilabilir fakat generic olarak yazmak daha iyi olur.
    // T.type
    
    func get(url: String, params: [String: Any], complete: () -> ()) {
        AF.request(url, method: .get, parameters: params)
    }
    
    func post(url: String, params: [String: Any]) {
        AF.request(url, method: .post, parameters: params)
    }
    
    func delete() {
        //
    }
    
    func insert() {
        //
    }
    
    func upload() {
        //
    }
    
    //yukaridaki fonksiyonlardan gelen verileri parse edecegimiz fonksiyon yazabiliriz
    func handleParse() {
        
    }
}
