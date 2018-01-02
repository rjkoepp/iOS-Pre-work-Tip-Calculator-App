//
//  ViewController.swift
//  Tipsy
//
//  Created by Robert Koepp on 12/26/17.
//  Copyright © 2017 Robert Koepp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var CustomTip: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    
    @IBOutlet weak var numPeople: UITextField!
    @IBOutlet weak var customTotal: UILabel!
    @IBOutlet weak var divBar: UIView!
    
    // labels
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var customTipPercent: UILabel!
    @IBOutlet weak var tipRightLabel: UILabel!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var totalCaptionLabel: UILabel!
    
    
    
    let defaults = UserDefaults.standard
    let numFormat = NumberFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
       // self.view.endEditing(true)
        let defChoice = defaults.integer(forKey: "DefaultTip")
        tipControl.selectedSegmentIndex = defChoice
        calculateTip(self)
        
        let nightMode = defaults.bool(forKey: "nightMode")

        if nightMode {
            nightModeOn()
        }

        else {
            nightModeOff()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
      
        let tipPercentages = [0.18, 0.2, 0.25, 0]
        
        // defaults 0 if nil
        let bill = Double(billField.text!) ?? 0
        
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]

        if (tipPercentages[tipControl.selectedSegmentIndex] == 0) {
            tipPercent = Double(CustomTip.text!) ?? 0
        }
        
        let tip = bill*tipPercent
        let total = bill + tip 
        
        // split per person
        let total2 = total/2
        let total3 = total/3
        
        numFormat.numberStyle = .currency
        numFormat.locale = Locale.current
        
        tipLabel.text = numFormat.string(from: NSNumber(value: tip))
        totalLabel.text = numFormat.string(from: NSNumber(value: total))
        totalLabel2.text = numFormat.string(from: NSNumber(value: total2))
        totalLabel3.text = numFormat.string(from: NSNumber(value: total3))
        
        
        let num = Double(numPeople.text!) ?? 0

        var temp = total/num
        
        if (num == 0) {
            temp = 0
        }
        
        customTotal.text = numFormat.string(from: NSNumber(value: temp))

    }
    
    func nightModeOn()
    {
        
        // yellow -> purple
        self.view.backgroundColor = UIColor.darkGray
        divBar.backgroundColor = UIColor.blue // cyan
        tipLabel.textColor = .green
        totalLabel.textColor = .green
        totalLabel2.textColor = .green
        totalLabel3.textColor = .green
        customTotal.textColor = .green
        tipControl.tintColor = .magenta
        billLabel.textColor = .magenta
        customTipLabel.textColor = .magenta
        tipRightLabel.textColor = .magenta
        numPeople.textColor = .magenta
        totalCaptionLabel.textColor = .magenta
        customTipPercent.textColor = .magenta
        numPeopleLabel.textColor = .magenta
        billField.backgroundColor = UIColor.gray
        billField.textColor = .green
        
        CustomTip.backgroundColor = UIColor.gray
        CustomTip.textColor = .green
        numPeople.backgroundColor = UIColor.gray
        numPeople.textColor = .green

    }

    func nightModeOff()
    {
        self.view.backgroundColor = UIColor.white
        divBar.backgroundColor = UIColor.darkGray
        tipLabel.textColor = .black
        totalLabel.textColor = .black
        totalLabel2.textColor = .black
        totalLabel3.textColor = .black
        customTotal.textColor = .black
        customTipLabel.textColor = .black
        numPeople.textColor = .black
        totalCaptionLabel.textColor = .black
        customTipPercent.textColor = .black
        tipControl.tintColor = .blue
        billLabel.textColor = .black
        tipRightLabel.textColor = .black
        totalCaptionLabel.textColor = .black
        billField.backgroundColor = .white
        billField.textColor = .black
        numPeopleLabel.textColor = .black

        CustomTip.backgroundColor = .white
        CustomTip.textColor = .black
        numPeople.backgroundColor = .white
        numPeople.textColor = .black

    }
    /*
     func showToast(message : String) {
     
     let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
     toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
     toastLabel.textColor = UIColor.white
     toastLabel.textAlignment = .center;
     toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
     toastLabel.text = message
     toastLabel.alpha = 1.0
     toastLabel.layer.cornerRadius = 10;
     toastLabel.clipsToBounds  =  true
     self.view.addSubview(toastLabel)
     UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
     toastLabel.alpha = 0.0
     }, completion: {(isCompleted) in
     toastLabel.removeFromSuperview()
     })
     } }
     */

}

// ways to improve
// settings (first thing to do!!!)
// - change how many split


// change currency
    // choose like top 3 toggle for currency to appear on bottom
// dark mode vs light mode
// splitting with multiple groups of people (add a slider?)
// splash screen
// add memory of previous save, oo

/* Completed:
 
 Settings save tip default
 Change tip to Local currency
 Keyboard defualt on (not dimiss)
 Custom tip 
 Number of split
 Color
 
 */
/* to do next:

 Save state
 
 
 
 */

