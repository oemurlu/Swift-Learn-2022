//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let a = UIImage(named: "DiceOne")
        let b = UIImage(named: "DiceTwo")
        let c = UIImage(named: "DiceThree")
        let d = UIImage(named: "DiceFour")
        let e = UIImage(named: "DiceFive")
        let f = UIImage(named: "DiceSix")
        
        let diceArray = [a, b, c, d, e, f ]
        
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        
    }
    
}

