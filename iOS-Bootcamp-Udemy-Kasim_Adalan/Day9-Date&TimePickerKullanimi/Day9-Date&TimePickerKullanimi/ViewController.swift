//
//  ViewController.swift
//  Day9-Date&TimePickerKullanimi
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfSaat: UITextField!
    @IBOutlet weak var tfTarih: UITextField!
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        //iOS 13.4 oncesinde tekerlekli sistem kullaniliyo. O daha cok sevildigi icin yeni surumde de tekerlekli kullanalim.
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
       
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        //bu tapRecognizer: hangi view'e eklediysek onun icin calisio. Yani kucuk view'ler olusturup onlara ozel de tapRecognizer yapabiliriz
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
        
    }
    
    @objc func dokunmaAlgilamaMetod() {
        print("ekrana dokunuldu")
        view.endEditing(true) // ekrandaki acilan seyleri kapatir. klavye vs gibi.
    }
    
    @objc func tarihGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "hh:mm"
        
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }


}

