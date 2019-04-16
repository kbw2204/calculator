//
//  calculator.swift
//  calculator
//
//  Created by 강병우 on 14/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

class Calculate {
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    private var operation: Dictionary<String, Operation> = [
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "×" : Operation.BinaryOperation({$0 * $1}),
        "−" : Operation.BinaryOperation({$0 - $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "=" : Operation.Equals,
        "+/-" : Operation.UnaryOperation({-$0}),
        "AC" : Operation.Constant(0)
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double)-> Double)
        case Equals
    }
    private struct BinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperation: Double
    }
    func performOperand(symbol: String) {
        if let operation = operation[symbol]{
            switch operation {
            case .Constant(let ConstantValue):
                accumulator = ConstantValue
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                equal()
                pending = BinaryOperationInfo(binaryFunction: function, firstOperation: accumulator)
            case .Equals:
                equal()
            }
        }
    }
    func equal() {
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperation, accumulator)
            pending = nil
        }
    }
    private var pending : BinaryOperationInfo?
    var result: Double {
        get {
            return accumulator
        }
    }
}
