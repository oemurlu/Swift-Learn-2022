//
//  AnasayfaViewModel.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 22.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var fRepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    init() {
        veritabaniKopyala()
        filmlerListesi = fRepo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle() {
        fRepo.filmleriYukle()
    }
    
    func veritabaniKopyala(){
        // xcode'daki sql dosyasi
        let bundleYolu = Bundle.main.path(forResource: "filmler_app", ofType: ".sqlite")
        
        //telefonda kopyalayacagimiz yol
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        
        // fileManager ile kopyalama yapacagiz
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }
    
}
