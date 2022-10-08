//
//  ViewController.swift
//  AutoLayout-iOS13
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let i1 = UIImage(named: "DiceOne")
        let i2 = UIImage(named: "DiceTwo")
        let i3 = UIImage(named: "DiceThree")
        let i4 = UIImage(named: "DiceFour")
        let i5 = UIImage(named: "DiceFive")
        let i6 = UIImage(named: "DiceSix")

        let allDice = [i1, i2, i3, i4, i5, i6]
        
        diceImageView1.image = allDice[Int.random(in: 0...5)]
        diceImageView2.image = allDice[Int.random(in: 0...5)]
        
    }
    
}

