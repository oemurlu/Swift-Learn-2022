//
//  ProfileViewModel.swift
//  loginApp-MVVM
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import Foundation

final class ProfileViewModel {
    
    var welcomeMessage: ObserVableObject<String?> = ObserVableObject(nil)
    //observableObject'ten string bsi gelebilir ve ilk degeri nil olsun.
    
    func getUser() {
        let user = NetworkService.shared.getUser()
        self.welcomeMessage.value = "Merhaba, \(user.name)"
    }
    
}
