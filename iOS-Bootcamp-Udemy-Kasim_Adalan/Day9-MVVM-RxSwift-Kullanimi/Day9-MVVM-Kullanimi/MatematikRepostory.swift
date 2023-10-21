//
//  MatematikRepostory.swift
//  Day9-MVVM-Kullanimi
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import Foundation
import RxSwift

// mesela database olsaydi databaseRepostory de olustururduk ek olarak. Ne kadar gruplarsak o kadar ii.
class MatematikRepostory {
    var sonuc = BehaviorSubject<String>(value: "0")
    
    func toplamaYap(alinanSayi1: String, alinanSayi2: String) {
        if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2) {
            let toplam = sayi1 + sayi2
            sonuc.onNext(String(toplam)) // Tetikleme
        }
    }
    
    func carpmaYap(alinanSayi1: String, alinanSayi2: String) {
        if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2) {
            let carpim = sayi1 * sayi2
            sonuc.onNext(String(carpim)) // Tetikleme
        }
    }
}
