//
//  ToDoDaoRepository.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import Foundation
import RxSwift

// Data Access Objecjt
class ToDoDaoRepository {
    
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: dbURL.path)
    }
    
    func kaydet(yapilacak: String) {
        db?.open()
        
        do {
            try db?.executeUpdate("INSERT INTO yapilacaklar (yapilacak) VALUES (?)", values: [yapilacak])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func guncelle(yapilacak: String, id: Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("UPDATE yapilacaklar SET yapilacak = ? WHERE id = ?", values: [yapilacak, id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(id: Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("DELETE FROM yapilacaklar WHERE id = ?", values: [id])
            yapilacaklariYukle()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacaklariYukle() {
        db?.open()
        
        var liste = [ToDo]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            
            while rs.next() {
                let yapilacak = ToDo(id: Int(rs.string(forColumn: "id"))!,
                                     icerik: rs.string(forColumn: "yapilacak")!)
                
                liste.append(yapilacak)
            }
            toDoList.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ara(aramaKelimesi: String) {
        db?.open()
        
        var liste = [ToDo]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak like '%\(aramaKelimesi)%'", values: nil)
            
            while rs.next() {
                let yapilacak = ToDo(id: Int(rs.string(forColumn: "id"))!,
                                     icerik: rs.string(forColumn: "yapilacak")!)
                liste.append(yapilacak)
            }
            toDoList.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}

/*
 repostiry pattern'i verileri tek bir merkezden cekiyoken kullaniyoz daha cok galiba ama kafama oturmayan kisimlar var. bu pattern'in rxswift ile alakasi cok var mi onu anlamadim.
 rxswift kullanirken mesela bu app'te anasayfaController'da toDoList'e subscribe oluyoz. buna subscribe olmak icin de
 
 var toDoList = [ToDo]()
mesela bunu viewmodel'de tanimlayamiyom cunku zaten viewmodel'de subscribe oldum. controllerda tanimlamak sacma degil mi ? viewmodel'de logic oluyo
 controller'da toDoList arrayini tanimlamak sacma degil mi ? 
 */
