//
//  TeamsViewController.swift
//  Communication-Pattern-Delegate
//
//  Created by Osman Emre Ömürlü on 2.03.2023.
//

import UIKit

class TeamsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func postNotification(data: [String : String]) {
        NotificationCenter.default.post(name: NSNotification.Name("teamSelection"), object: nil, userInfo: data)
    }
    
    @IBAction func gsButtonTapped(_ sender: Any) {
        postNotification(data: ["logo": "gs", "name": "GALATASARAY"])
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fbButtonTapped(_ sender: Any) {
        postNotification(data: ["logo": "fb", "name": "FENERBAHCE"])
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bjkButtonTapped(_ sender: Any) {
        postNotification(data: ["logo": "bjk", "name": "BESIKTAS"])
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tsButtonTapped(_ sender: Any) {
        postNotification(data: ["logo": "ts", "name": "TRABZONSPOR"])
        dismiss(animated: true, completion: nil)
    }
}
