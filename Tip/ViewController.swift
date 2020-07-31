
import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        billAmountTextField.becomeFirstResponder()
        tipPercentageLabel.text = String("$0.00");
        totalLabel.text = String("$0.00")
    }
    
    
    // retrieve default tip percentage from UserDefaults and use it to update the tip amount
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // load tip percentage from UserDefaults
        let tipValue = defaults.integer(forKey: "TipIndex")
        tipAmountSegmentedControl.selectedSegmentIndex = tipValue
        calculateTip(Any.self)
        
        // update views with the correct theme colors
        let changeTheme = defaults.bool(forKey:"darkMode")
        
        // if true
        if changeTheme {
            // change colors
            view.backgroundColor = .gray
            billAmountTextField.backgroundColor = .gray
            tipAmountSegmentedControl.backgroundColor = .gray
            tipAmountSegmentedControl.selectedSegmentTintColor = .darkGray
            lineView.backgroundColor = .darkGray
        } else {
            view.backgroundColor = UIColor(named: "PaleYellow")
            billAmountTextField.backgroundColor = UIColor(named: "PaleYellow")
            tipAmountSegmentedControl.backgroundColor = UIColor(named: "PaleYellow")
            tipAmountSegmentedControl.selectedSegmentTintColor = UIColor(named: "DarkerPaleYellow")
            lineView.backgroundColor = UIColor(named: "DarkerPaleYellow")
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
//        1. Get the initial bill amount and calculate the tips.
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]

//        2. Calculate the total cost.
        let total = bill + tip

//        3. Update the tip and total labels.
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

