//
//  TeamsViewController.swift
//  Communication-Pattern-Delegate
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import UIKit

protocol TeamSelectionDelegate {
    func teamSelection(logo: UIImage, name: String)
}

class TeamsViewController: UIViewController {

    var delegate: TeamSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gsButtonTapped(_ sender: Any) {
        delegate?.teamSelection(logo: UIImage(named: "gs.png")!, name: "GALATASARAY")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fbButtonTapped(_ sender: Any) {
        delegate?.teamSelection(logo: UIImage(named: "fb.png")!, name: "FENERBAHCE")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bjkButtonTapped(_ sender: Any) {
        delegate?.teamSelection(logo: UIImage(named: "bjk.png")! , name: "BESIKTAS")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tsButtonTapped(_ sender: Any) {
        delegate?.teamSelection(logo: UIImage(named: "ts.png")!, name: "TRABZONSPOR")
        dismiss(animated: true, completion: nil)
    }
}
