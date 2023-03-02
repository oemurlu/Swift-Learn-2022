//
//  ViewController.swift
//  Communication-Pattern-Delegate
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("teamSelection"), object: nil, queue: nil) { notification in
            //TODO:  handle user info
            let userInfo = notification.userInfo
            self.logoImage.image = UIImage(named: userInfo?["logo"] as! String)
            self.titleLabel.text = userInfo?["name"] as! String
        }
    }
    
    @IBAction func selectionButtonTapped(_ sender: UIButton) {
        let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "\(TeamsViewController.self)") as! TeamsViewController
        show(viewcontroller, sender: nil)
    }
    

}

