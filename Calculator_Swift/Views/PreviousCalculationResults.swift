//
//  PreviousCalculationResults.swift
//  Calculator_Swift
//
//  Created by Md Asif Huda on 4/27/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import UIKit

class PreviousCalculationResults: UITableViewController {

    var viewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PreviousCalculationTableViewCell
        let calculations = viewController.computations[indexPath.row]
        cell.calculationLabel.text = calculations.ansewrSentance

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.computations.count
    }
}
