//
//  BillingInformation.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/22/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class BillingInformation: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var stepperPoints: UIStepper!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var scrollableView: UIScrollView!
    

    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func pointStepperPressed(_ sender: UIStepper) {
        pointsLabel.text = String(Int(sender.value))
        
    }
    
    func getPoints() -> Int{
        let r = PointCalculatorController()
        r.verifiedPoints = Int(pointsLabel.text!)!
        return r.verifiedPoints
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let initialPointDisplay = PointCalculator()
        pointsLabel.text = String(initialPointDisplay.getPoints())

        
        stepperPoints.maximumValue = 99
        stepperPoints.stepValue = 1
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
