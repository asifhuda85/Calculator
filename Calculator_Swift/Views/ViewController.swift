//
//  ViewController.swift
//  Calculator_Swift
//
//  Created by Md Asif Huda on 4/27/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var answer = 0
    var numbers: [Int] = []
    var segueIdentifier = "segue"
    var calc = Calculator(state: .nuteral)
    var computations: [PreviousCalculation] = []

    @IBOutlet weak var calculatorScreenViewLabel: UILabel!
    @IBOutlet weak var computedResultsLabel: UILabel!
    @IBOutlet weak var COMPIUTEDLABEL: UILabel!
    
    @IBOutlet weak var calculatorScreenView: UILabel!
    @IBOutlet weak var computedResults: UILabel!

    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        calculatorScreenView.text = calculatorScreenView.text! + String(sender.tag)
    }
    
    @IBAction func calculateButton(_ sender: AnyObject) {
        numbers.append(Int(calculatorScreenView.text!)!)
        var state = Calculator.CalculatorFunctions.add.rawValue
        switch calc.state {
        case .adding:
            state = Calculator.CalculatorFunctions.add.rawValue
            answer = calc.add(a: numbers[0], b: numbers[1])
            calculatorScreenView.text = String(answer)
        case .subtracting:
            state = Calculator.CalculatorFunctions.subtract.rawValue
            answer = calc.subtract(a: numbers[0], b: numbers[1])
            calculatorScreenView.text = String(answer)
        case .nuteral:
            answer = 0
        default:
            break
        }
        
        let previouscomp = PreviousCalculation(operation: state, a: numbers[0], b: numbers[1], answer:String(answer))
        addComputaion(computation: previouscomp)
        computedResults.text = calc.returnComputedResults(computations:computations)
        numbers = []
    }
    
    @IBAction func operationButtonPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            numbers.append(Int(calculatorScreenView.text!)!)
            calculatorScreenView.text = calc.clear()
            calc.state = .adding
        case 1:
            numbers.append(Int(calculatorScreenView.text!)!)
            calculatorScreenView.text = calc.clear()
            calc.state = .subtracting
        case 2:
            numbers = []
            calculatorScreenView.text = calc.clear()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorScreenView.text = calc.clear()
        computedResults.text = calc.returnComputedResults(computations:computations)
    }
    
    func addComputaion(computation:PreviousCalculation){
        computations.append(computation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destination = segue.destination as! PreviousCalculationResults
            destination.viewController = self
        }
    }

}

