//
//  ViewController.swift
//  10-Landmark-Book-App
//
//  Created by Osman Emre Ömürlü on 13.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //simdi yapacagim arrayler verimli degil aslinda ama bu projede asil amac tableview'i ogrenmek oldugu icin verimli yolu ileride ogrenecegiz. landmarkNames ve landmarkImages eklerken ayni sira ile ekleyelim isim ve resimi. NOT: array tanimlamalarini diger fonksiyonlarda kullanabilmek icin class'in altina tanimladim(move ettim)
        //var landmarkNames = [String]()
        landmarkNames.append("Colesseum")
        landmarkNames.append("Statue of Liberty")
        landmarkNames.append("Statue of Jesus")
        landmarkNames.append("Pamukkale")
        landmarkNames.append("Cologne Cathedral")
        landmarkNames.append("Maiden\'s Tower")
        
        //var landmarkImages = [UIImage]()
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "usa")!)
        landmarkImages.append(UIImage(named: "brazil")!)
        landmarkImages.append(UIImage(named: "pamukkale")!)
        landmarkImages.append(UIImage(named: "cologne")!)
        landmarkImages.append(UIImage(named: "maiden's-tower")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell.textLabel?.text = "test" //onceden bu kod ile yapiliyomus ama artik yapilmiyor. hoca kursta kolaylik olsun diye bunu kullanirsa ben kullanamayacagim yeni yontemi kullanacagim.
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkName = chosenLandmarkName
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    //tableView Commit sayesinde bize editingStyle veriliyor. delete, insert filan imkani sagliyo
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
}

