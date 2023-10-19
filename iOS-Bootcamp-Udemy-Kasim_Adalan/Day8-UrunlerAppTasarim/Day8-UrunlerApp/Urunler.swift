//
//  Urunler.swift
//  Day8-UrunlerApp
//
//  Created by Osman Emre Ömürlü on 19.10.2023.
//

import Foundation

class Urunler {
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
