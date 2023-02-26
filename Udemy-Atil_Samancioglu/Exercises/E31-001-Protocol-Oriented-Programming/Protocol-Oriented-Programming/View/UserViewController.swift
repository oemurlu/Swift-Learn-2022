//
//  ViewController.swift
//  Protocol-Oriented-Programming
//
//  Created by Osman Emre Ömürlü on 25.02.2023.
//

import UIKit

class UserViewController: UIViewController, UserViewModelProtocol {
    
    private let viewModel: UserViewModel
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        viewModel.fetchUsers()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGray4
        
        view.addSubview(emailLabel)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 30),
            usernameLabel.widthAnchor.constraint(equalToConstant: 200),
            usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
        ])
        
        nameLabel.text = "namelabel text"
        emailLabel.text = "email text"
        usernameLabel.text = "username text"
    }
    
    
    func updateView(name: String, email: String, username: String) {
        nameLabel.text = name
        emailLabel.text = email
        usernameLabel.text = username
    }


}

