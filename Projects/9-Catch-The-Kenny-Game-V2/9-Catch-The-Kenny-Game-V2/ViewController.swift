//
//  ViewController.swift
//  9-Catch-The-Kenny-Game-V2
//
//  Created by Osman Emre Ömürlü on 11.09.2022.
//
//  Projeyi yapim asamalari
//  1- Main (oyun) dizayni
//  2- Skoru arttir
//  3- Geriye sayma
//  4- Kenny hareket ettirme (resimleri kapatip 1 tanesini random acma)
//  5- Yeniden oyna veya oynama butonu ekleme
//  6- High score kaydetme
//  7- High score resetleme butonu (kendim dusundum)
//  8- Oyun basina play butonu (kendim dusundum) bu sayede app acilir acilmaz oyun baslamaz ve no butonuna tiklayinca play butonu gelir ve istedigimiz zaman geri oynayabiliriz.

import UIKit

class ViewController: UIViewController {

    //Variables
    var score = 0
    var highScore = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]() //boyle tanimladik cunku asagida tanimlayacagimiz kennyArray dizisinde her kenny'nin tipi UIImageView.
    var hideTimer = Timer()
    
    
    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    @IBOutlet weak var playLabel: UIImageView!
    @IBOutlet weak var resetLabel: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        let storedHighScore = UserDefaults.standard.object(forKey: "highScoreKey")
        highScoreLabel.text = "High Score: \(storedHighScore ?? 0)"
        
        //Images
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        resetLabel.isUserInteractionEnabled = true
        playLabel.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizerReset = UITapGestureRecognizer(target: self, action: #selector(resetScore))
        let recognizerPlay = UITapGestureRecognizer(target: self, action: #selector(playGame))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        resetLabel.addGestureRecognizer(recognizerReset)
        playLabel.addGestureRecognizer(recognizerPlay)
        
        //Hide Kenny icin array
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        hideKenny()
        
        
        
    }
    @objc func playGame()
    {
        //play button gizle
        playLabel.isHidden = true
        playLabel.isUserInteractionEnabled = false
        //Timer
        counter = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
        
        //Hide Timer
        hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(unHideKenny), userInfo: nil, repeats: true)
        
    }
    
    @objc func increaseScore()
    {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func resetScore()
    {
        highScore = 0
        highScoreLabel.text = "High Score: \(highScore)"
    }
    
    @objc func hideKenny()
    {
        for kenny in kennyArray
        {
            kenny .isHidden = true
        }
    }
    
    @objc func unHideKenny() {
        for kenny in kennyArray
        {
            kenny .isHidden = true
        }
        let randomInt = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[randomInt].isHidden = false

    }

    @objc func countDownTimer(){
        counter -= 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            //High Score
            if score > highScore {
                highScore = score
                highScoreLabel.text = "High Score: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highScoreKey")
            }
            
            //Alert
            let alert = UIAlertController(title: "Time's up!", message: "Play Again ?", preferredStyle: UIAlertController.Style.alert)
            let noButton = UIAlertAction(title: "NO", style: UIAlertAction.Style.destructive)
            { UIAlertAction in
                self.playLabel.isHidden = false
                self.playLabel.isUserInteractionEnabled = true
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
            }
            let yesButton = UIAlertAction(title: "YES", style: UIAlertAction.Style.default)
            { UIAlertAction in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "Time: \(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDownTimer), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.unHideKenny), userInfo: nil, repeats: true)
                //simdi tanimlarken baslarina self koydum cunku self demek bu calistigimiz class'a ozgu olan demek. self.score olunca bu class'ta en ustte tanimladigimiz score'u kast edicez. self olmadan yazarsak hangi score kast ettigimiz anlasilmaz program hata verir. bunu yapiyoz cunku suan ic ice fonksiyondayiz. class->countdown->if->yesButton(UIAlertAction)
            }
            alert.addAction(noButton)
            alert.addAction(yesButton)
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
    }

}

