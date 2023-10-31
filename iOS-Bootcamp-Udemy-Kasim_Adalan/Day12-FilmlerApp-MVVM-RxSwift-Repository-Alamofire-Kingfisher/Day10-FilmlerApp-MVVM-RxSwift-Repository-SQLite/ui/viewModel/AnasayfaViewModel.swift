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
        filmlerListesi = fRepo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle() {
        fRepo.filmleriYukle()
    }
    
}
