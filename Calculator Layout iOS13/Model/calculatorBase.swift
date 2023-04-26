//
//  calculatorBase.swift
//  Calculator Layout iOS13
//
//  Created by Kushima Amane on 2023/04/24.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

class caluclatorLogic { // using tuple
    
    private var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    private var baseNumber: Double = 0 // 最初に入力した数字
    private var laterComeNumber: Double = 0 // 後に入力した数字
    private var currentResult: Double = 0
    private var numTuple: (baseNumber: Double, operand: String) = (0, "")
    
    func calculator(_ number: Double, operand: String) {
        print(number)
        baseNumber = number
        numTuple.baseNumber = number
        numTuple.operand = operand
        
        print("this is number tuple")
        print(numTuple)
        print("this is basenumber ====== \(baseNumber)")
        guard let ope = Double(operand) else {
            print("this is operand")
            return
        }
//        switch operand {
//        case K.operands().add:
//
//        case K.operands().minus:
//        case K.operands().multiply:
//        case K.operands().devision:
//        }
    }
    
    // Methods
    func add(_ number: Double) {
        baseNumber = number
        print("base number \(baseNumber)")
        currentResult += number
        print("current result ======= \(currentResult)")
    }
    
    func subtract(_ number: Double) {
        baseNumber = number
        currentResult -= number
        print(currentResult)
    }
    
    func multiply(by number: Double) {
        baseNumber = number
        currentResult *= number
        print(currentResult)
    }
    
    func divide(by number: Double) throws {
        baseNumber = number
        guard number != 0 else {
            throw CalculationError.divideByZero
        }
        currentResult /= number
        print(currentResult)
    }
    
    func percentage(_ number: Double) -> Double{
        return number * 0.01
    }
    
    func equal(_ number: Double, operand: String) -> String {
        return String(baseNumber + number)
    }
    
    func clear() {
        baseNumber = 0
        currentResult = 0
    }
    
    func getCurrentResult() -> Double {
        return currentResult
    }
}

enum CalculationError: Error {
    case divideByZero
}
