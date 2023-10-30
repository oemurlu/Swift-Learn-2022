//
//  KisiKayitViewModel.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation

class KisiKayitViewModel {
    var kRepo = kisilerDaoRepository()
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        kRepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
