//
//  toDoKayit.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import UIKit

class ToDoKayit: UIViewController {

    @IBOutlet weak var tfYapilacak: UITextField!
    
    let viewModel = KayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }
    
    @IBAction func kaydetButton_TUI(_ sender: UIButton) {
        if let yapilacak = tfYapilacak.text {
            viewModel.kaydet(yapilacak: yapilacak)
        }
    }
}

extension ToDoKayit: DelegateScreen {
    func dismissScreen() {
        navigationController?.popViewController(animated: true)
    }
}
