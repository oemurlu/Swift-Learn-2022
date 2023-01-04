import UIKit

let loveScore = Int.random(in: 0...100)

func loveCalculator(){
    
    print("ur lovescore: \(loveScore)")
    
    switch loveScore {
    case 75...100: //75 ve 100 dahil
        print("u love her so much")
    case 41..<75:  //75 dahil degil demek
        print("avarage love")
    case ...40:
        print("you'll be forever alone zorttt")
    default:
        print("ERROR: loveScore is out of range.")
    }
    
//    if loveScore == 100 {
//        print("u love very much")
//    }
//    else {
//        print("u will be forever alone zorttt")
//    }
}

var dictionary : [String : Int] = ["oe.moto": 10]

print(dictionary["oe.moto"]!)

loveCalculator()

//zartingen
//zotrintkk sds askdsakda sa dmk
//asdl as,dlsa,dlsa;,da,sd
///asdaskmdkasldmlaskdmadm
