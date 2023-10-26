//
//  ToDoDetayViewModel.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import Foundation

class DetayViewModel {
    
    let repo = ToDoDaoRepository()
    weak var delegate: DelegateScreen?
    
    func guncelle(yapilacak: String, id: Int) {
        repo.guncelle(yapilacak: yapilacak, id: id)
        print(delegate)
        delegate?.dismissScreen()
    }
}
