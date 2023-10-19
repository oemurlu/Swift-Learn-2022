//
//  ViewController.swift
//  KullaniciEtkilesimi
//
//  Created by Osman Emre Ömürlü on 15.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Baslik", message: "Mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "Iptal", style: .cancel) { _ in //handler ile bsiler yapabilirsin istersen
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) // handler olmadan
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Baslik", message: "Mesaj", preferredStyle: .actionSheet)
        
        
        let iptalAction = UIAlertAction(title: "Iptal", style: .cancel) { _ in
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive)
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
        
    }
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Baslik", message: "Mesaj", preferredStyle: .alert)
        
        alertController.addTextField() { textField in // index'i 0
            textField.placeholder = "Veri giriniz"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        alertController.addTextField() // index'i 1
        
        let tamamAction = UIAlertAction(title: "Kaydet", style: .cancel) { action in
            let tf = alertController.textFields![0] as UITextField
            let tf1 = alertController.textFields![1] as UITextField
            
            if let alinanVeri = tf.text, let alinanVeri1 = tf1.text {
                print("veri: \(alinanVeri) & \(alinanVeri1)")
            }
        }
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
}

