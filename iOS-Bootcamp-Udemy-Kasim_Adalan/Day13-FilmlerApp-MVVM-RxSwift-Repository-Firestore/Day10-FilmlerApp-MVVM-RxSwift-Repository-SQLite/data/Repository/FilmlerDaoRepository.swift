//
//  FilmlerDaoRepository.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 22.10.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

// Dao: Database access object.

class FilmlerDaoRepository {
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    var collectionFilmler = Firestore.firestore().collection("Filmler")
    let db = Firestore.firestore()

    func filmleriYukle() {
        collectionFilmler.getDocuments { snapshot, error in
            var liste = [Filmler]()

            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    
                    let id = document.documentID
                    let ad = data["ad"] as? String ?? ""
                    let resim = data["resim"] as? String ?? ""
                    let fiyat = data["fiyat"] as? Int ?? 0
                    
                    let film = Filmler(id: id, ad: ad, resim: resim, fiyat: fiyat)
                    liste.append(film)
                }
            }
            self.filmlerListesi.onNext(liste)
        }
    }
}
