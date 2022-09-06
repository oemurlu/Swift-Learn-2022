//
//  ViewController.swift
//  3-Birthday-Note-Taker-App
//
//  Created by Osman Emre Ömürlü on 6.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //== 2 ==/
        //en son denenen veri uygulama ilk acilinca gosterme:
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //storedName ve storedBirthday Any? objesi oldugu icin stringe cevirilirse nameLabele yazma islemi:
        if let newName = storedName as? String {
            nameLabel.text = "Last added: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        } 
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        //== 1 ==//
//        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
//        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")

        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
    }
    
    
    
    @IBAction func deleteClicked(_ sender: Any) {
//        let storedName = UserDefaults.standard.object(forKey: "name")
//        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
//
//        if ((storedName as? String) != nil) {
//            UserDefaults.standard.removeObject(forKey: "name")
//        }
//        if ((storedBirthday as? String) != nil) {
//            UserDefaults.standard.removeObject(forKey: "birthday")
//        }
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // "" vs nil  farki: "" bile olsa deger var demek bos olsa bile. ama nil demek hic bir deger yok demek.
        if ((storedName as? String) != nil) {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        if ((storedBirthday as? String) != nil) {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }

        
        
    }
}

