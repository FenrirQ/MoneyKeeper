//
//  CalculatorModel.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 6/24/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

struct CalculatorServices {
    
    private var accumulator: Double?
    private enum Operation {
        case reset
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> =
    [
        "x": Operation.binaryOperation{$0 * $1},
        ":": Operation.binaryOperation{$0 / $1},
        "+": Operation.binaryOperation{$0 + $1},
        "-": Operation.binaryOperation{$0 - $1},
        "=": Operation.equals,
        "C": Operation.reset
    ]
    
    //user tap symbols button
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            case .reset:
                accumulator = nil
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    //set operand to calculate result
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    func deleteButton(_ text: String) -> String {
        var digits = Array(text.characters)
        digits.remove(at: digits.count - 1)
        return String(digits)
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
