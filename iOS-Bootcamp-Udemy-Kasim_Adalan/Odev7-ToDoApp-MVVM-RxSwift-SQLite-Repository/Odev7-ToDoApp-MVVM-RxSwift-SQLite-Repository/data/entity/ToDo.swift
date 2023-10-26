//
//  ToDo.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import Foundation

class ToDo {
    
    var id: Int?
    var yapilacak: String?
    
    
    init() {}
    
    init(id: Int, icerik: String) {
        self.id = id
        self.yapilacak = icerik
    }
    
}
