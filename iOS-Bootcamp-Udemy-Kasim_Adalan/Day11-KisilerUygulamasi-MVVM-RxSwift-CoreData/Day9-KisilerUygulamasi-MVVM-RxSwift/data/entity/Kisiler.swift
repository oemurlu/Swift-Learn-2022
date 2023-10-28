//
//  Kisiler.swift
//  Day7-KisilerUygulamasi
//
//  Created by Osman Emre Ömürlü on 18.10.2023.
//

import Foundation

class Kisiler {
    var kisi_id: Int?
    var kisi_ad: String?
    var kisi_tel: String?
    
    init(){}
    
    init(kisi_id: Int, kisiad: String, kisitel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisiad
        self.kisi_tel = kisitel
    }
}
