//
//  Filmler.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import Foundation

class Filmler {
    
    var id: String?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init() {}
    
    init(id: String, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
}
