//
//  Kisiler.swift
//  Day7-KisilerUygulamasi
//
//  Created by Osman Emre Ömürlü on 18.10.2023.
//

import Foundation

class Kisiler {
    var kisi_id: Int?
    var kisiad: String?
    var kisitel: String?
    
    init(){}
    
    init(kisi_id: Int, kisiad: String, kisitel: String) {
        self.kisi_id = kisi_id
        self.kisiad = kisiad
        self.kisitel = kisitel
    }
}
