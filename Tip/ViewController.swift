
import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    
    var lightMode:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        switchTheme()
        
        tipPercentageLabel.text = String("$0.00");
        totalLabel.text = String("$0.00")
        
    }
//    struct ColorManager {
//        static let paleYellow = Color("PaleYellow")
//        static let darkerYellow = Color("DarkerPaleYellow")
//    }
    
    fileprivate func switchTheme() {
        if lightMode {
            view.backgroundColor = UIColor(named: "PaleYellow")
            billAmountTextField.backgroundColor = UIColor(named: "PaleYellow")
            tipAmountSegmentedControl.backgroundColor = UIColor(named: "PaleYellow")
            tipAmountSegmentedControl.selectedSegmentTintColor = UIColor(named: "DarkerPaleYellow")
            lineView.backgroundColor = UIColor(named: "DarkerPaleYellow")
            
        } else {
            view.backgroundColor = .gray
            billAmountTextField.backgroundColor = .gray
            tipAmountSegmentedControl.backgroundColor = .gray
            tipAmountSegmentedControl.selectedSegmentTintColor = .darkGray
            lineView.backgroundColor = .darkGray
        }
    }
    
    @IBAction func switchMode(_ sender: UIBarButtonItem) {
        lightMode.toggle()
        switchTheme()
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

