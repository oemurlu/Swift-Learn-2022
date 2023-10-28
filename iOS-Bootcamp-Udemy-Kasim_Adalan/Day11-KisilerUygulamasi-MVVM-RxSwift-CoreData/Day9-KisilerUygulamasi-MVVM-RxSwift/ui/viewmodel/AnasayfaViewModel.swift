//
//  AnasayfaViewModel.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var kRepo = kisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    init() {
        kisilerListesi = kRepo.kisilerListesi
        kisileriYukle()
    }

    func sil(kisi: KisilerModel) {
        kRepo.sil(kisi: kisi)
    }
    
    func ara(aramaKelimesi: String) {
        kRepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        kRepo.kisileriYukle()
    }

    
}
