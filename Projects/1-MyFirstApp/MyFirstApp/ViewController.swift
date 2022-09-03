//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Osman Emre Ömürlü on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var number = 0
    @IBOutlet weak var oemurluLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeClicked(_ sender: Any) {
        if number == 0 {
            imageView.image = UIImage(named: "wallpaper2")
            number += 1
        }
        else if number == 1 {
            imageView.image = UIImage(named: "wallpaper1")
            number -= 1
        }
    }
}

 
