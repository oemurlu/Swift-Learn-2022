//
//  kisilerDaoRepository.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation
import RxSwift
import CoreData

// DAO: Data Access Object
class kisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    // veri tabanina erisme context'i. bu context sayesinde save yapicaz
    let context = appDelegate.persistentContainer.viewContext
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        let kisi = KisilerModel(context: context)
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    func guncelle(kisi: KisilerModel, kisi_ad: String, kisi_tel: String) {
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    func sil(kisi: KisilerModel) {
        context.delete(kisi)
        appDelegate.saveContext()
        kisileriYukle()
    }
    
    func ara(aramaKelimesi: String) {
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS[c] %@", aramaKelimesi)
            let liste = try context.fetch(fr) // KisilerModel entity'sini veriyo bize.
            kisilerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func kisileriYukle() {
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest()) // KisilerModel entity'sini veriyo bize.
            kisilerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
    }
}
