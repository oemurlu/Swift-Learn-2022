//
//  ViewController.swift
//  MVVM-1
//
//  Created by Osman Emre Ömürlü on 23.02.2023.
//

import UIKit

class MVVMExampleViewController: UIViewController {

    
    @IBOutlet weak var helloLabel: UILabel!
    
    var viewModel: MVVMExampleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
   
    @IBAction func sayHelloButtonPressed(_ sender: UIButton) {
        viewModel?.userTriggeredSayHelloButton()
    }
    
    func bindViewModel() {
        if let viewModel = viewModel {
            viewModel.helloText.bind { helloText in
                DispatchQueue.main.async {
                    // When value of the helloText Dynamic variable
                    // is set or changed in the ViewModel, this code will
                    // be executed
                    self.helloLabel.text = helloText
                }
            }
        }
    }
    
}

