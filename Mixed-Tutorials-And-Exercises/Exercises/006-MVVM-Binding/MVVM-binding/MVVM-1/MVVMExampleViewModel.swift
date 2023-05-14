//
//  MVVMExampleViewModel.swift
//  MVVM-1
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import Foundation

class MVVMExampleViewModel {
    
    var helloText = Dynamic("")
    
    func userTriggeredSayHelloButton() {
        helloText.value = "hello"
    }
    
}
