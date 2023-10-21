//
//  kisilerDaoRepository.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation
import RxSwift

// DAO: Data Access Object
class kisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        print("ad: \(kisi_ad), tel: \(kisi_tel)")
    }
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        print("GUNCELLE: id: \(kisi_id), ad: \(kisi_ad), tel: \(kisi_tel)")
    }
    
    func sil(kisi_id: Int) {
        print("Kisi sil: \(kisi_id)")
        kisileriYukle() // ???????
    }
    
    func ara(aramaKelimesi: String) {
        print("ara: \(aramaKelimesi)")
    }
    
    func kisileriYukle() {
        var liste = [Kisiler()]
        
        let k1 = Kisiler(kisi_id: 1, kisiad: "ahmet", kisitel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisiad: "mehmet", kisitel: "2222")
        let k3 = Kisiler(kisi_id: 3, kisiad: "zeynep", kisitel: "3333")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi.onNext(liste)
    }
}
