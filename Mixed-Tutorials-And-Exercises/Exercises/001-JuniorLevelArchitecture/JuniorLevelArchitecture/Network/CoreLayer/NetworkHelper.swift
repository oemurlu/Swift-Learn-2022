//
//  NetworkHelper.swift
//  JuniorLevelArchitecture
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

// bu helper'da api call edecegiz ya base url filan onlari yaziyoruz.

import Alamofire

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    var baseURL = "www.dummyApi.com/v1/"
    
    // headers dosyamiz olabilir mesela. AF httpHeader tipinde veri dondurcek
    func headers() -> HTTPHeaders {
        ["Auth": "Bearer token"] //token gibi seyleri userDefaults'ta tutma. Keychain'de tutulmali.
    }
    
    func saveToken(token: String) {
        //save token to keychain
    }
    
    
}
