//
//  SettingsViewController.swift
//  Tip
//
//  Created by Eunice Oh on 7/22/20.
//  Copyright © 2020 Eunice Oh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    @IBOutlet var settingsSegmentedControl: UISegmentedControl!
    @IBOutlet var darkModeToggle: UISwitch!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        //defaults.set(0, forKey: "newTipIndex")
        //defaults.synchronize()
        print("Settings View Controller - View Did Load")
        
        let changeTheme = defaults.bool(forKey: "darkMode")
        if changeTheme {
            darkModeToggle.setOn(true, animated: true)
        }  else {
            darkModeToggle.setOn(false, animated: true)
        }
        
        let currDefaultTip = defaults.integer(forKey: "TipIndex")
        settingsSegmentedControl.selectedSegmentIndex = currDefaultTip
    }
    
    // save the new default tip percentage each time the user changes it on the settings screen
    // add a light/dark color theme to the settings view
    // In viewWillAppear, update views with the correct theme colors
    
    @IBAction func defaultTipChanged(_ sender: UISegmentedControl) {
        let index  = settingsSegmentedControl.selectedSegmentIndex
        defaults.set(index, forKey: "TipIndex")
        defaults.synchronize()
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if darkModeToggle.isOn {
            print("dark mode")
            defaults.set(true, forKey: "darkMode")
        } else {
            defaults.set(false, forKey: "darkMode")
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print("Settings View Controller - View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Settings View Controller - View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //let intValue = defaults.integer(forKey: "newTipIndex")
        //settingsSegmentedControl.selectedSegmentIndex = intValue
        
        print("Settings View Controller - View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Settings View Controller - View Did Disappear")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        settingsSegmentedControl.selectedSegmentIndex = index
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
