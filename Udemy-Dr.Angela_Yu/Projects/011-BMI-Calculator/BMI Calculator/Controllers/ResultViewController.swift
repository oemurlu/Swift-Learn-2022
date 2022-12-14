//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Osman Emre Ömürlü on 18.10.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    

    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true) //geri donmemizi saglar, pop-screen kapatir
    }
    
}
