//
//  ProtocolOrientedProgramming.swift
//  P.O.P-Telephones
//
//  Created by Osman Emre Ömürlü on 27.02.2023.
//

/*
P.O.P PLAN
- RotaryPhone: Landline telephone, Rotaryable
- PushButtonPhone: Landline telephone, PushButtonable
- NonSmartPhone: Cellular Telephone, PushButtonable
- SmartPhone: Cellular telephone, Touchable
*/

import Foundation

class TelephoneClass {
    func call() {
        // call
    }
    
    func hangUp() {
        // hangUp
    }
}
// oop yapiyor olsaydik classlari inherit ederdik. o yuzd

protocol Telephone {
    var phoneNo: String { get set }
    func call()
    func hangUp()
}

extension Telephone {
    func call() {
        //
    }

    func hangUp() {
        //
    }
}
// extensionda verdigimiz ozellikleri class'ta kullanmak zorunda degiliz.
// ama phoneNo extensionda vermediimiz icin her class'ta kullanmak zorundayiz.

protocol Landline: Telephone {
    
}

protocol Cellular: Telephone {
    func sendSMS()
}

protocol RotaryAble {
    func rotaryInout()
}

protocol PushButtonable {
    func buttonInput()
}

protocol Touchable {
    func touchInput()
}


class RotaryPhone: Landline, RotaryAble {
    func rotaryInout() {
        
    }
    
    var phoneNo: String
    
    init(phoneNo: String) {
        self.phoneNo = phoneNo
    }
}

class PushButtonPhone: Landline, PushButtonable {
    func buttonInput() {
        
    }
    
    var phoneNo: String
    
    init(phoneNo: String) {
        self.phoneNo = phoneNo
    }
}

class NonSmartPhone: Cellular, PushButtonable {
    func sendSMS() {
        
    }
    
    func buttonInput() {
        
    }
    
    var phoneNo: String
    
    init(phoneNO: String) {
        self.phoneNo = phoneNO
    }
}

class SmartPhone: Cellular, Touchable {
    func sendSMS() {
        
    }
    
    func touchInput() {
        
    }
    
    var phoneNo: String
    
    init(phoneNo: String) {
        self.phoneNo = phoneNo
    }
}
