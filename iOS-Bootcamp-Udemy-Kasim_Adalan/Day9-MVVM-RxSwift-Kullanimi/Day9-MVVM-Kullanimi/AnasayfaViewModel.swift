//
//  AnasayfaViewModel.swift
//  Day9-MVVM-Kullanimi
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var sonuc = BehaviorSubject<String>(value: "0")
    var mRepo = MatematikRepostory()
    
    init() { //burdaki class'tan nesne olustugu zaman burdaki sonuc mrepo'daki sonuca esitlenecek (baglanacak)
        sonuc = mRepo.sonuc
    }
    
    func toplamaYap(alinanSayi1: String, alinanSayi2: String) {
        mRepo.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    func carpmaYap(alinanSayi1: String, alinanSayi2: String) {
        mRepo.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
}
