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
    
    @IBAction func selectionButtonTapped(_ sender: UIButton) {
        let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "\(TeamsViewController.self)") as! TeamsViewController
        viewcontroller.delegate = self // bu kisim cok onemli
        show(viewcontroller, sender: nil)
    }
}

extension MainViewController: TeamSelectionDelegate {
    func teamSelection(logo: UIImage, name: String) {
        logoImage.image = logo
        titleLabel.text = name
    }
}

