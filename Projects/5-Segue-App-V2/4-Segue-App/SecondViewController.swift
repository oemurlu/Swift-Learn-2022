//
//  SecondViewController.swift
//  4-Segue-App
//
//  Created by Osman Emre Ömürlü on 5.09.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var incomingName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = incomingName
        
    }

}
