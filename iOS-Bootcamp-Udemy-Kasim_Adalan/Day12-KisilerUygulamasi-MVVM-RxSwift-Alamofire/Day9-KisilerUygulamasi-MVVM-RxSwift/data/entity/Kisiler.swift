//
//  Kisiler.swift
//  Day7-KisilerUygulamasi
//
//  Created by Osman Emre Ömürlü on 18.10.2023.
//

import Foundation

class Kisiler: Codable {
    var kisi_id: String?
    var kisi_ad: String?
    var kisi_tel: String?
    
    init(){}
    
    init(kisi_id: String, kisiad: String, kisitel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisiad
        self.kisi_tel = kisitel
    }
}
