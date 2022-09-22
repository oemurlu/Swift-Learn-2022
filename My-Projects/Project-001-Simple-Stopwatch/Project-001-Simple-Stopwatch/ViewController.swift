//
//  ViewController.swift
//  Project-001-Simple-Stopwatch
//
//  Created by Osman Emre Ömürlü on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0.0
    var isPlaying = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playButtonClicked(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
   
    
    
    
    @objc func timeUp() {
//        timeLabel.text = "\(counter)"
        timeLabel.text = String(format: "%.1f", counter)


        counter += 0.1
    }
    
    @IBAction func pauseButtonClicked(_ sender: Any) {
        timer.invalidate()
        
        
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        counter = 0
        timeLabel.text = "\(counter)"
        timer.invalidate()
    }
    
}

