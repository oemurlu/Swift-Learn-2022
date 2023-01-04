import UIKit

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Osman", forKey: "Name")
defaults.set(Date(), forKey: "LastDate")

let array = [1,2,3]
defaults.set(array, forKey: "myArray")

let dictionary = ["name": "osman"]
defaults.set(dictionary, forKey: "myDictionary")



//forKey: hangi key ile kayit ettiysek o key ile cagircaz geri.
// defaults. dan sonra hangi tipteyse onu yazcaz. float, string, array, bool, object vs.

let volume = defaults.float(forKey: "Volume")
let isOpened = defaults.bool(forKey: "MusicOn")
let userName = defaults.string(forKey: "Name")
let lastOpenedDate = defaults.object(forKey: "LastDate")
let arr1 = defaults.array(forKey: "myArray") //any tipinde
let arr2 = defaults.array(forKey: "myArray") as! [Int] //int tipinde
let dict = defaults.dictionary(forKey: "myDictionary")


//UserDefaults birkac kb olan kucuk verileri tutmak icindir.
//UserDefautls database degildir, database gibi kullanmak yanlistir
