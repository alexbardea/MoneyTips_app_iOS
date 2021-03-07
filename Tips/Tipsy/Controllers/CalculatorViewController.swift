//
//  ViewController.swift
//  Tips
//
//  Created by Alex Bardea on 09/12/2020.
//
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //
    var billTotal = 0.0
    var finalResult = "0.0"
    var tip = 0.10
    var valueStepper = 1
    var numberOfPeople = 2
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // end fill the bill text field
        billTextField.endEditing(true)
        
        // for deselecting button
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // highlight th selection % tip
        sender.isSelected = true
        
        // we drop the percentage sign from text button and by amplifing w 100 we get the tip (0, 0.1, 0.25)
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        print(tip)
    }
    
    // if we add more people the stepperValueChanged get trigerred
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
  
        if sender.value > 1 {
     valueStepper = valueStepper + 1
    splitNumberLabel.text = String(valueStepper)
  }
        // we get the nuber of people as float w/o decimals
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        
        //calculate the bill
        let bill = billTextField.text!
               if bill != "" {
                   billTotal = Double(bill)!
                   let result = billTotal * (1 + tip) / Double(numberOfPeople)
                   finalResult = String(format: "%.2f", result)
               }
        
        // we print final bill for each person
        print(finalResult)
        
        // Initiates the segue with the specified identifier from the current view controller's storyboard file.
        self.performSegue(withIdentifier: "goToResults", sender: self)
    
    }
    
//    @IBAction func calculatePressed(_ sender: UIButton) {
//         let bill = billTextField.text!
//               if bill != "" {
//                   billTotal = Double(bill)!
//                   let result = billTotal * (1 + tip) / Double(numberOfPeople)
//                   finalResult = String(format: "%.2f", result)
//               }
//
//        print(finalResult)
//        self.performSegue(withIdentifier: "goToResults", sender: self)
//    }
    
    // as it folows, we prepare aour data to be transfered to the ResultViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //"goToResults is the name of the <transition>"
        if segue.identifier == "goToResults"
        {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalResult = finalResult
            destinationVC.tip = Int(tip*100)
            destinationVC.split = numberOfPeople
            
        }
    
    }
}
