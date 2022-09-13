//
//  ViewController.swift
//  6-Simple-User-Sign-Up-App
//
//  Created by Osman Emre Ömürlü on 8.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: Any) {
    
        /*
         //Alert olusturma ve alert mesajini kapatma butonu ekleme:
        let alert = UIAlertController(title: "Error", message: "Wrong Input", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            // button clicked actions
            print("button clicked")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        */
        
        if usernameText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Please enter username")
        } else if passwordText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Please enter password")
        } else if passwordText.text != password2Text.text {
            makeAlert(titleInput: "Error", messageInput: "Passwords do not match")
        } else {
            makeAlert(titleInput: "Success", messageInput: "Registration completed")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
    
    
    


