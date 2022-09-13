//
//  ViewController.swift
//  2-CalculatorApp
//
//  Created by Osman Emre Ömürlü on 3.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let hiMessage = "Simple Calculator App Opened"
        print(hiMessage)
    }

    @IBAction func sumClicked(_ sender: Any) {
        //alttaki unlemlerin anlami: firstText.text'ten kesinlikle veri girilcek demek.
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber + secondNumber
                resultLabel.text = String("\(firstNumber) + \(secondNumber) = \(result)")
            }
        }
    }
    
    
    @IBAction func minusClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber - secondNumber
                resultLabel.text = String("\(firstNumber) - \(secondNumber) = \(result)")
            }
        }
    }
    
    @IBAction func multiplyClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber * secondNumber
                resultLabel.text = String("\(firstNumber) * \(secondNumber) = \(result)")
            }
        }
    }
    @IBAction func divideClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber / secondNumber
                resultLabel.text = String("\(firstNumber) / \(secondNumber) = \(result)")
            }
        }
            
    }
    
}

