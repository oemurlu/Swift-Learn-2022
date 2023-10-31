//
//  Filmler.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import Foundation

class Filmler: Codable {
    
    var id: Int?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init() {}
    
    init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
}
