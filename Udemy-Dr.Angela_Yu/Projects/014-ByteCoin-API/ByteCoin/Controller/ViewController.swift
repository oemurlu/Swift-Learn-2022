//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinmanager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinmanager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
}
//MARK: - CoinManagerDelegate

    extension ViewController: CoinManagerDelegate {
        func didUpdatePrice(price: String, currency: String) {
            DispatchQueue.main.async {
                self.bitcoinLabel.text = price
                self.currencyLabel.text = currency
            }
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
    }
    
    //MARK: - UIPickerView DataSource & Delegate

    extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return coinmanager.currencyArray.count

        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return coinmanager.currencyArray[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedCurrency = coinmanager.currencyArray[row]
            coinmanager.getCoinPrice(for: selectedCurrency)
        }
    }
    
    
    



