//
//  CryptoViewModel.swift
//  Crypto-List-MVVM
//
//  Created by Osman Emre Ömürlü on 24.02.2023.
//

//extensionlari struct icine de yazabilirsin ama daha dogru kullanimi extension icine yazmaktir.

import Foundation

struct CryptoListViewModel {
    
    let cryptoCurrencyList: [CryptoCurrency]

}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return cryptoCurrencyList.count
    }
    
    //bu fonks ile CryptoListViewModel ve CryptoViewModel'i birbirine bagliyoruz
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}


struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
}

extension CryptoViewModel {
    var name: String {
        return cryptoCurrency.currency
    }
    
    var price: String {
        return cryptoCurrency.price
    }
}
