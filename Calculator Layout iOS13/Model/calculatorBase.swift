//
//  calculatorBase.swift
//  Calculator Layout iOS13
//
//  Created by Kushima Amane on 2023/04/24.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

class caluclatorLogic {
    
    func calculator(calcSet : (num: String, operand: String, laterComer: String)) -> String{
        
        let baseNumber = Double(calcSet.num)!
        let laterComeNumber = Double(calcSet.laterComer)!
        
        switch calcSet.operand {
        case K.operands().add:
            add(formarNumber: baseNumber, latter: laterComeNumber)
            
        case K.operands().minus:
            subtract(formarNumber: baseNumber, latter: laterComeNumber)
            
        case K.operands().multiply:
            multiply(formarNumber: baseNumber, latter: laterComeNumber)
            
        case K.operands().devision:
            
            do {
                try divide(formarNumber: baseNumber, latter: laterComeNumber)
            } catch CalculationError.divideByZero {
                print("Error: Divide by zero")
            } catch {
                print(error)
            }
            
        default:
            print("default")
        }
    }
    
    // Methods
    func add(formarNumber: Double, latter: Double) {
        let resultNumber = formarNumber + latter
        print("結果　\(resultNumber)")
    }
    
    func subtract(formarNumber: Double, latter: Double) {
        let resultNumber = formarNumber - latter
        print("結果　\(resultNumber)")
    }
    
    func multiply(formarNumber: Double, latter: Double) {
        let resultNumber = formarNumber * latter
        print("結果　\(resultNumber)")
    }
    
    func divide(formarNumber: Double, latter: Double) throws {
        guard latter != 0 else {
            throw CalculationError.divideByZero
        }
        let resultNumber = formarNumber / latter
        print("結果　\(resultNumber)")
    }
    
    func percentage(_ number: String) -> String {
        return String(Double(number)! * 0.01)
    }
    
    func getNegativeNumber(number: String) -> String { // 正・負の数を返す
        let result = Double(number)! * Double(-1)
        return String(result)
    }
}

enum CalculationError: Error {
    case divideByZero
}
