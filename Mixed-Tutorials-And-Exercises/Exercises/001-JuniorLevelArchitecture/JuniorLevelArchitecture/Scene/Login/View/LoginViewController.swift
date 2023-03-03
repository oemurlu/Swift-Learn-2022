//
//  LoginViewController.swift
//  JuniorLevelArchitecture
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func loginButtonTapped() {
        viewModel.loginUser(email: "email", password: "password") {
            // do something (artik ne yapilcaksa onu yapariz yani)
        }
    }
}
