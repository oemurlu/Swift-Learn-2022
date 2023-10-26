//
//  AnasayfaViewModel.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var repo = ToDoDaoRepository()
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    init() {
        dbKopyala()
        toDoList = repo.toDoList
        yapilacaklariYukle()
    }
    
    func sil(id: Int) {
        repo.sil(id: id)
    }
    
    func dbKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabani zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch let e {
             print("catch error yakaladi :\(e)")
            }
        }
    }
    
    func yapilacaklariYukle() {
        repo.yapilacaklariYukle()
    }
    
    func ara(aramaKelimesi: String) {
        repo.ara(aramaKelimesi: aramaKelimesi)
    }
}
