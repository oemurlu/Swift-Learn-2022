//
//  LoginVC.swift
//  login-page-programmaticUI
//
//  Created by Osman Emre Ömürlü on 17.01.2024.
//

//NSLayoutConstraint kullanacaksak '.translatesAutoresizingMaskIntoConstraints = false' yapmaliyiz.
// Layout: Stackview icin .addSubView() kullanamayiz cunku stackView'in kendine has subView'leri oldugu icin .addArrangedSubView() kullanmaliyiz.

import UIKit
import AuthenticationServices

class LoginVC: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "madeByOEMURLU")
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your e-mail"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    let signInWithGoogleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in with Google", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    let signInWithAppleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.systemGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 1
        stackView.clipsToBounds = true
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationItem.title = "Login Screen"
        
        setLayouts()
        setSignInWithAppleDelegate()
        addTargets()
        setNavBarWhite(viewController: self)    }
    
    func setNavBarWhite(viewController: UIViewController) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor : UIColor.black,
                                          .font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        // tema black seciyoruz ve ustteki saat, wifi ve pil gostergesi beyaz renkte gozukuyor.
        
        self.title = "Welcome"
        self.navigationItem.backButtonTitle = "Back"
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    func addTargets() {
        signInButton.addTarget(self, action: #selector(signInClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
    }
    
    func setLayouts() {
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(signInWithGoogleButton)
        stackView.addArrangedSubview(signInWithAppleStackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signInWithGoogleButton.heightAnchor.constraint(equalToConstant: 50),
            signInWithAppleStackView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func setSignInWithAppleDelegate() {
        let auth = ASAuthorizationAppleIDButton()
        signInWithAppleStackView.addArrangedSubview(auth)
    }
    
    @objc func signInClicked() {
        if let email = emailTextField.text, let pw = passwordTextField.text {
            print("email: \(email)\npw: \(pw)")
        }
    }
    
    @objc func signUpClicked() {
        let vc = SignUpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
