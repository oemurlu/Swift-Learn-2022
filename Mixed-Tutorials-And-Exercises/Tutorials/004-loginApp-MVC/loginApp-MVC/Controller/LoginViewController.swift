//
//  ViewController.swift
//  loginApp-MVC
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitViews()
    }

    //MARK: - Interaction handlers
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        NetworkService.shared.login(username: usernameField.text!, password: passwordField.text!) { success in
            if success { // yani completion true ise bu blok calisir.
                self.goToProfilePage()
            } else {
                print("invalid credentials")
            }
        }
    }
    
    //MARK: - Functions
    ///touchable kisimlar haric yerlere tiklanildiginda klavye kapatilma islemi
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func validateFields() {
        loginButton.isEnabled = (usernameField.text != "" && passwordField.text != "")
    }
    
    private func setInitViews() {
        usernameField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
    }
    
    private func goToProfilePage() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        present(vc, animated: true)
    }
}

