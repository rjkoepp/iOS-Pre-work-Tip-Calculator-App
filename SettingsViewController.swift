//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Robert  Koepp on 12/26/17.
//  Copyright © 2017 Robert Koepp. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate  {

    @IBOutlet weak var defaultTips: UISegmentedControl!
    
    @IBOutlet weak var colorSwitch: UISwitch!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        
        self.navigationController?.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func colorSwitch(_ sender: Any) {
        let mode = colorSwitch.isOn
        defaults.set(mode, forKey: "nightMode")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func defaultChosen(_ sender: Any) {
        
        let choice = defaultTips.selectedSegmentIndex
        defaults.set(choice, forKey: "DefaultTip")
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        colorSwitch.isOn = defaults.bool(forKey: "nightMode")
        
        let defaultTip = defaults.integer(forKey: "DefaultTip")
        defaultTips.selectedSegmentIndex = defaultTip
        
    }


}
