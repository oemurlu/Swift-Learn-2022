//
//  ObservableObject.swift
//  loginApp-MVVM
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import Foundation

final class ObserVableObject<T> {
    
    var value: T?{
        didSet {
            listener?(value)
            //value degisince listener'a value degerini ata.
        }
    }
    private var listener: ((T?) -> Void)?

    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
    
    
}
