//
//  PreviousCalculation.swift
//  Calculator_Swift
//
//  Created by Md Asif Huda on 4/27/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import Foundation

class PreviousCalculation {
    
    var operation: String
    var a: Int
    var b: Int
    var ansewrSentance: String
    var answer: String
    
    init(operation:String,a:Int,b:Int,answer:String){
        self.operation = operation
        self.a = a
        self.b = b
        self.answer = answer
        self.ansewrSentance = "\(a) \(operation) \(b) = \(answer)"
    }
}
