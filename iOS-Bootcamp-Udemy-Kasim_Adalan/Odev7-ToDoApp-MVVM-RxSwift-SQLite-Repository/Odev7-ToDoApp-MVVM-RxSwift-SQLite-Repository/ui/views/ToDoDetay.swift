//
//  toDoDetay.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import UIKit

class ToDoDetay: UIViewController {
    
    @IBOutlet weak var yapilacakLabel: UITextField!
    
    let viewModel = DetayViewModel()
    var yapilacak: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        if let y = yapilacak {
            yapilacakLabel.text = y.yapilacak
        }
    }
    
    @IBAction func guncelleButton_TUI(_ sender: UIButton) {
        if let icerik = yapilacakLabel.text, let y = yapilacak {
            viewModel.guncelle(yapilacak: icerik, id: y.id!)
        }
    }
}

extension ToDoDetay: DelegateScreen {
    func dismissScreen() {
        navigationController?.popViewController(animated: true)
    }
}
