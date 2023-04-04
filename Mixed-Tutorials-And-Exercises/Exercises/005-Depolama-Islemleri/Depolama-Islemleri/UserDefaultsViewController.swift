//
//  ViewController.swift
//  Depolama-Islemleri
//
//  Created by Osman Emre Ömürlü on 3.04.2023.
//

import UIKit

//bu controller'i sadece userDef nasil yapilir onu gostermek icin yazdim. yoksa projede bu controlleri kullanmiyoruz
class UserDefaultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func userDefYaz(value: Any, key: String) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize() // yazma islemi
    }

    func userDefOku(key: String) -> String {
        if let deger = UserDefaults.standard.string(forKey: key) {
            return deger
        }
        return ""
    }
    
    func userDefSil(key: String) {
        if UserDefaults.standard.object(forKey: key) != nil {
            UserDefaults.standard.removeObject(forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}

