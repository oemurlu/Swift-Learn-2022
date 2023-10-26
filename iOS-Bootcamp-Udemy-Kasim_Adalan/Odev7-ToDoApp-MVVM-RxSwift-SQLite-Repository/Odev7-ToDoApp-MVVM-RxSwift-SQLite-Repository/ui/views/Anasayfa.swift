//
//  ViewController.swift
//  Odev7-ToDoApp-MVVM-RxSwift-SQLite-Repository
//
//  Created by Osman Emre Ömürlü on 25.10.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [ToDo]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

        _ = viewModel.toDoList.subscribe(onNext: { liste in
            self.toDoList = liste
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "anasayfaToDetay" {
            if let yapilacak = sender as? ToDo {
                let destinationVC = segue.destination as! ToDoDetay
                destinationVC.yapilacak = yapilacak
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.yapilacaklariYukle()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// TableView
extension Anasayfa: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak = toDoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        cell.labelYapilacak.text = yapilacak.yapilacak
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = toDoList[indexPath.row]
        performSegue(withIdentifier: "anasayfaToDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// Delete Row
extension Anasayfa {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contexualAction, view, bool in
            
            let yapilacak = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Silme Islemi", message: "Silinsin mi ???", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "Iptal", style: .cancel)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                //evet'e tikladiktan sonra olacak handler
                self.viewModel.sil(id: yapilacak.id!)
            }
            
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

// SearchBar
extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

