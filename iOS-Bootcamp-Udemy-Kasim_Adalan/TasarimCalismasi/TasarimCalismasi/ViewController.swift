//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Osman Emre Ömürlü on 12.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pizza"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "anaRenk")
//        appearance.backgroundColor = .green
        appearance.titleTextAttributes = [.foregroundColor : UIColor(named: "yaziRenk1")!,
                                          .font: UIFont(name: "Pacifico-Regular", size: 22)!]
        navigationController?.navigationBar.barStyle = .black // tema black seciyoruz ve ustteki saat, wifi ve pil gostergesi beyaz renkte gozukuyor.
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }


}

