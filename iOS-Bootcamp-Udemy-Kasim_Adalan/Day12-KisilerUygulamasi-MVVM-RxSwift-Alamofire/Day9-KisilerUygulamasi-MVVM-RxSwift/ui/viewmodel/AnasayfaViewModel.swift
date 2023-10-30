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
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        kisilerListesi = kRepo.kisilerListesi
        kisileriYukle()
    }

    func sil(kisi_id: Int) {
        kRepo.sil(kisi_id: kisi_id)
    }
    
    func ara(aramaKelimesi: String) {
        kRepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        kRepo.kisileriYukle()
    }

    
}
