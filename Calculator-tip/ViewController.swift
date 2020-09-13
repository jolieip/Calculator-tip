//
//  ViewController.swift
//  Calculator-tip
//
//  Created by Jolie Ip Ying See on 11/09/2020.
//  Copyright © 2020 ecotegrity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet var numberOfPaxLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet var amountPerPaxLbl: UILabel!
    
    @IBOutlet var thankYoubutton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.stepValue = 1.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
               super.viewDidAppear(animated)
               billAmountTextField.becomeFirstResponder()
       }
       
    @IBAction func onTap(_ sender: Any) {
    
         view.endEditing(true)
    }
    

   
    @IBAction func calculateTip(_ sender: Any) {
         
     
        // Get initial bill amount and calculate tips
          let bill = Double(billAmountTextField.text!) ?? 0.0
        
           let tipPercentages = [0.15,0.18,0.2]
           
           // Calculate tip and total
           let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
           let total = bill + tip
        // Update the tip and total labels
         tipPercentageLabel.text = String(format: "$%.2f%", tip)
         totalLabel.text = String(format: "$%.2f", total)
         numberOfPaxLabel.text = String(Int(stepper.value) + 1)
        amountPerPaxLbl.text = String(format: "$%.2f", (total/(Double(numberOfPaxLabel.text!) ?? 1.0)))
        
           
    }
   
    
   
}

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
    class DesignableLabel: UILabel {
    }

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}


