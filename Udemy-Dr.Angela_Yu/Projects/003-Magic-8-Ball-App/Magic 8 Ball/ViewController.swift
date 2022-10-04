//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        let i1 = UIImage(named: "ball1")
        let i2 = UIImage(named: "ball2")
        let i3 = UIImage(named: "ball3")
        let i4 = UIImage(named: "ball4")
        let i5 = UIImage(named: "ball5")
        
        let imageArray = [i1, i2, i3, i4, i5]
        
        imageView.image = imageArray[Int.random(in: 0...4)]
    }
    
}

