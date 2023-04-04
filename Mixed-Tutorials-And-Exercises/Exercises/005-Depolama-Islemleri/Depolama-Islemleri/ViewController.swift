//
//  ViewController.swift
//  Depolama-Islemleri
//
//  Created by Osman Emre Ömürlü on 4.04.2023.
//

import UIKit

//tema rengini userDefaults'a kaydedecegiz. uygulama kapanirken tema neyse acilinca da o olacak.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // uygulama acildiginda  tema neyse o olsun
        TemaUygula()
    }


    @IBAction func btnAcik_TUI(_ sender: Any) {
        TemaYaz(tema: "A")
        TemaUygula()
    }
    
    @IBAction func btnKoyu_TUI(_ sender: Any) {
        TemaYaz(tema: "K")
        TemaUygula()
    }
    
    func TemaYaz(tema: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(tema, forKey: "tema")
        userDefaults.synchronize()
    }
    
    func TemaUygula() {
        if UserDefaults.standard.string(forKey: "tema") == "K" {
            view.backgroundColor = UIColor(named: "koyu")
        } else {
            view.backgroundColor = UIColor(named: "acik")
        }
    }
    
    
    
}
