//
//  calculatorBase.swift
//  Calculator Layout iOS13
//
//  Created by Kushima Amane on 2023/04/24.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

class caluclatorLogic {
    private var baseNumber: Double = 0 // 最初に入力した数字
    private var laterComeNumber: Double = 0 // 後に入力した数字
    private var operandVariable: String = ""
    private var currentResult: Double = 0
    private var numTuple: (baseNumber: Double, operand: String) = (0, "") {
        didSet {
            print("oldvalue basenumber \(oldValue.baseNumber)")
            baseNumber = oldValue.baseNumber
            print("oldvalue operand \(oldValue.operand)")
        }
        willSet {
            print("willset basenumber \(newValue.baseNumber)")
            laterComeNumber = newValue.baseNumber
            print("willset operand \(newValue.operand)")
            operandVariable = newValue.operand
        }
    }
    
    func calculator(calcNumber: Double? = nil, operand: String? = nil) {
        print("calculater function ==========================")
        
        if let operand_ = operand {
            if operand_ == K.operands().equal { // イコールボタンが押された
                print("イコールボタンが押された ================ ")
                print(baseNumber.isZero)
                
                if !operandVariable.isEmpty && !baseNumber.isZero && !laterComeNumber.isZero { // 計算できる条件が揃っている
                    print("計算できる条件が揃った ============== ")
                    switch operandVariable {
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
            } else {
                numTuple.operand = operand!
            }
            
        } else { // 数字の処理
            numTuple.baseNumber = calcNumber!
        }
        
        print("最初に計算する数：\(baseNumber)")
        print("処理：\(operandVariable)")
        print("後に計算する数：\(laterComeNumber)")
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
    
    func equal(_ number: Double, operand: String) -> String {
        return String(baseNumber + number)
    }
    
    func clear() {
        numTuple.baseNumber = 0
        numTuple.operand = ""
    }
    
    func getCurrentResult() -> Double {
        return currentResult
    }
    
    func getNegativeNumber(number: String) -> String {
        let result = Double(number)! * Double(-1)
        return String(result)
    }
}

enum CalculationError: Error {
    case divideByZero
}
