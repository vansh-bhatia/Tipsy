//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Vansh Bhatia on 1/24/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var billAmount = 0.0
    var tip = 0.1
    var splitNumber = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {

        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tip = (Double(sender.currentTitle!.replacingOccurrences(of: "%", with: "")) ?? 0) / 100
        // print(tipPercent)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // print(sender.value)
        // print(String(format: "%.f", sender.value))
        // print(round(sender.value*10)/10)
        billTextField.endEditing(true)
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Double(billTextField.text ?? "0") ?? 0
        billAmount = round((billAmount + billAmount * tip) / Double(splitNumber) * 100) / 100
        //print(billAmount)

        performSegue(withIdentifier: "goToResultPage", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultPage" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.settingsLabelText = "Split between \(splitNumber) people, with \(Int(tip * 100))% tip."
            destinationVC.totalLabelText = String(billAmount)

        }
    }
}

