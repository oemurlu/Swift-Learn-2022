//
//  ToDoKayitViewModel.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import Foundation

class KayitViewModel {
    
    let repo = ToDoDaoRepository()
    weak var delegate: DelegateScreen?
    
    func kaydet(yapilacak: String) {
        repo.kaydet(yapilacak: yapilacak)
        delegate?.dismissScreen()
    }
}
