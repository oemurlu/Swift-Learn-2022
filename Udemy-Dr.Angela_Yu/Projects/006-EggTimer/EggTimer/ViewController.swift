//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var secondsRemaining = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 1.0
        print(eggTimes[hardness]!)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsRemaining -= 1
            secondsPassed += 1
            textLabel.text = "Remaining time: \(secondsRemaining) second."
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }
        
        else  {
            timer.invalidate()
            textLabel.text = "Time's Up"
        }
    }
}
