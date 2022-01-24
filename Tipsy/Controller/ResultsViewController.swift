//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vansh Bhatia on 1/24/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    var totalLabelText: String?
    var settingsLabelText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalLabelText
        settingsLabel.text = settingsLabelText
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
