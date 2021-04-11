//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPcntTip: UIButton!
    @IBOutlet weak var tenPcntTip: UIButton!
    @IBOutlet weak var twentyPcntTip: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill = BillModel()
    
    func resetTipPercentageIndicators() {
        zeroPcntTip.isSelected = false
        tenPcntTip.isSelected = false
        twentyPcntTip.isSelected = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTipPercentageIndicators()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        resetTipPercentageIndicators()
        sender.isSelected = true
        
        bill.setTipPercentage(tipPercentage: sender.currentTitle!)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        bill.diners = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = billTextField.text!
        
        if total != "" {
            bill.doCalculate(total: total)
            
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinattionVC = segue.destination as! ResultsViewController
            destinattionVC.result = String(format: "%.2f", bill.individualAmount)
            destinattionVC.tip = Int(bill.tip * 100)
            destinattionVC.split = bill.diners
        }
    }
}

