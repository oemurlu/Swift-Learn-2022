//
//  MathematicFunctions.swift
//  SwiftTesting
//
//  Created by Osman Emre Ömürlü on 4.02.2024.
//

// This file for unit test.

import Foundation

protocol MathematicFunctionsInterface {
    func addIntegers(x: Int, y: Int) -> Int
    func multiplyIntegers(x: Int, y: Int) -> Int
    func divideIntegers(x: Int, y: Int) -> Int?
    
}

final class MathematicFunctions: MathematicFunctionsInterface {
    func addIntegers(x: Int, y: Int) -> Int {
        return x + y
    }
    
    func multiplyIntegers(x: Int, y: Int) -> Int {
        return x * y
    }
    
    func divideIntegers(x: Int, y: Int) -> Int? {
        if y == 0 {
            return nil
        }
        return x / y
    }
}
