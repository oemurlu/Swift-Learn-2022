//
//  kisilerDaoRepository.swift
//  Day9-KisilerUygulamasi-MVVM-RxSwift
//
//  Created by Osman Emre Ömürlü on 21.10.2023.
//

import Foundation
import RxSwift
import Alamofire

// DAO: Data Access Object
class kisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        let params: Parameters = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        AF.request("http://kasimadalan.pe.hu/test/insert_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data) //datayi alip CRUDCevap'a cevirdik burda.
                    print("basari: \(cevap.success!)")
                    print("mesaj: \(cevap.message!)")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        let params: Parameters = ["kisi_id": kisi_id, "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        AF.request("http://kasimadalan.pe.hu/test/update_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data) //datayi alip CRUDCevap'a cevirdik burda.
                    print("basari: \(cevap.success!)")
                    print("mesaj: \(cevap.message!)")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sil(kisi_id: Int) {
        let params: Parameters = ["kisi_id": kisi_id]
        AF.request("http://kasimadalan.pe.hu/test/delete_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data) //datayi alip CRUDCevap'a cevirdik burda.
                    print("basari: \(cevap.success!)")
                    print("mesaj: \(cevap.message!)")
                    self.kisileriYukle()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func ara(aramaKelimesi: String) {
        let params: Parameters = ["kisi_ad": aramaKelimesi]
        AF.request("http://kasimadalan.pe.hu/test/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

    }
    
    func kisileriYukle() {
        AF.request("http://kasimadalan.pe.hu/test/tum_kisiler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
