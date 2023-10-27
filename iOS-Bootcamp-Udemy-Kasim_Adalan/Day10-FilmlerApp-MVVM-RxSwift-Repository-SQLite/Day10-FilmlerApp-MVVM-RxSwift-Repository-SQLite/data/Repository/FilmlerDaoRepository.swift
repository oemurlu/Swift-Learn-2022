//
//  FilmlerDaoRepository.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 22.10.2023.
//

import Foundation
import RxSwift

// Dao: Database access object.

class FilmlerDaoRepository {
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func filmleriYukle() {
        db?.open()
        var liste = [Filmler]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM filmler", values: nil)
            
            // bir sonraki satiri okur
            while rs.next() {
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad"),
                                   resim: rs.string(forColumn: "resim"),
                                   fiyat: Int(rs.string(forColumn: "fiyat"))!)
                liste.append(film)
            }
            filmlerListesi.onNext(liste)

        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
