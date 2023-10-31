//
//  kisilerDaoRepository.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

// DAO: Data Access Object
class kisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        // ilk kayitta id kismini bos gondermemiz gerekiyor cunku id kendisi olusturuyor. Firestore'nin olusturdugu document id'yi dosyalari okurken kisi_id'ye verecegiz.
        let yeniKisi: [String : Any] = ["kisi_id": "", "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        collectionKisiler.document().setData(yeniKisi)
    }
    
    func guncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        let guncellenenKisi: [String: Any] = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        collectionKisiler.document(kisi_id).updateData(guncellenenKisi)
    }
    
    func sil(kisi_id: String) {
        collectionKisiler.document(kisi_id).delete()
    }
    
    func ara(aramaKelimesi: String) {
        collectionKisiler.addSnapshotListener { snapshot, error in
            var liste = [Kisiler]()
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()) {
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)
                    }
                }
            }
            self.kisilerListesi.onNext(liste)
        }
    }
    
    func kisileriYukle() {
        collectionKisiler.addSnapshotListener { snapshot, error in
            var liste = [Kisiler]()
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                    
//                    kendi eklediim bi kod (opsiyonel). kisi_id olusturduk ama bos string verdik ya olustururken. simdi istersek kisi_id'ye document id verebiliriz. vermeye gerek yok aslinda cunku lazim degil su anlik. Cunku update vs yaparken kisiye document id'den erisiyoruz. deneme amacli 3 verinin id'sini degistirdim. sonra comment line haline aldim.
                    
//                    self.collectionKisiler.document(kisi_id).updateData(["kisi_id": kisi_id])
                }
            }
            self.kisilerListesi.onNext(liste)
        }
    }
}
