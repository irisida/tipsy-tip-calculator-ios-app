//
//  BillModel.swift
//  Tipsy
//
//  Created by ed on 06/04/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct BillModel {
    var billTotal: Double = 0.0
    var tip: Double = 0.0
    var diners: Int = 2
    var individualAmount: Double = 0.0
    
    
    mutating func setTipPercentage(tipPercentage: String) {
        let PercentageAsNumber = tipPercentage.dropLast()
        tip = Double(PercentageAsNumber)! / 100
    }
    
    mutating func doCalculate(total: String) {
        billTotal = Double(total)!
        individualAmount = billTotal * (1 + tip) / Double(diners)
    }
}
