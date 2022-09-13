//
//  ViewController.swift
//  8-Timer-App
//
//  Created by Osman Emre Ömürlü on 9.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    var second = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        //input
        if let second = Int(timeText.text!){
            counter = second
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
            }
        print("button clicked")
    }
    
    @objc func timerFunc(){
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        if counter < 0 {
            timer.invalidate() // timer artik calismaz, .invalidate() ile durdururuz.
            timeLabel.text = "Time is over"
        }
    }
}

