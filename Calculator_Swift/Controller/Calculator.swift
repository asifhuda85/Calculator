//
//  Calculator.swift
//  Calculator_Swift
//
//  Created by Md Asif Huda on 4/27/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import Foundation

class Calculator {
    var state:State
    init(state:State) {
        self.state = state
    }
    
    enum CalculatorFunctions: String {
        case add = "+"
        case subtract = "-"
        case compute = "..."
        case clear = " "
    }
    
    enum State {
        case adding
        case subtracting
        case computing
        case nuteral
    }
    
    func returnState(state:State) -> State {
        var state = state
        switch state {
        case .adding:
            state = .adding
            return state
        case .subtracting:
            state = .subtracting
            return state
        case .computing:
            state = .computing
            return state
        default:
            state = .nuteral
            return state
        }
    }
    
    func add(a:Int, b:Int) -> Int {
        let result = a + b
        return result
    }
    
    func subtract(a:Int, b:Int) -> Int {
        let result = a - b
        return result
    }
    
    func clear() -> String {
        let result = ""
        return result
    }
    
    func returnComputedResults(computations: [PreviousCalculation]) -> String {
        return "Computed Resuts: \(computations.count)"
    }
}

