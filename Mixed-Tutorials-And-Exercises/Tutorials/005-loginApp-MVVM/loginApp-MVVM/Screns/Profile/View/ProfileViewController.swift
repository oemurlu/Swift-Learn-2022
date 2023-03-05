//
//  ProfileViewController.swift
//  loginApp-MVC
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    private let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        viewModel.getUser()
    }
    
    private func setupBinders() {
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.nameLabel.text = message as? String
        }
    }

}
