//
//  ResultsViewController.swift
//  Tips
//
//  Created by Alex Bardea on 09/12/2020.
//
//

import UIKit

// 2nd screen
class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalResult = "0.0"
    var tip = 10
    var split = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show us a label with payment description
        totalLabel.text = finalResult
        settingsLabel.text = "Split between \(split) people and also with \(tip)% tip."
       

    }
    
    // if we want to recalculate the bill we call by IBAction
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
     
        
    }
    
}
