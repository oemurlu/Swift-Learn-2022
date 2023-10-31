//
//  KisiDetayViewModel.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation

class KisiDetayViewModel {
    
    var kRepo = kisilerDaoRepository()
    
    func guncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        kRepo.guncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
}
