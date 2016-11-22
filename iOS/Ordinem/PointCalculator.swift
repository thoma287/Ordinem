//
//  PointCalculator.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/21/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class PointCalculator: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var countPlaceHolder: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var projectedAttendance: UITextField!
    @IBOutlet weak var projectedCost: UILabel!
    @IBOutlet weak var theScrollView: UIScrollView!
    
    var points = Double(1)
    var attendance = Double(1)
    
    @IBAction func pointStepperAction(_ sender: UIStepper) {
        countPlaceHolder.text = String(Int(sender.value))
        
    }
    
    func getPoints() -> Double{
        self.points = Double(countPlaceHolder.text!)!
        return self.points
    }
    
    func attToInt() -> Double{
        self.attendance = Double(projectedAttendance.text!)!
        return self.attendance
    }
    
    @IBAction func calculateClicked(_ sender: Any) {
        let total = Double(getPoints()*attToInt()*0.05)
        projectedCost.text = String(total)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        stepper.maximumValue = 99
        stepper.stepValue = 1
        // Do any additional setup after loading the view.
        

        
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        
        projectedAttendance.inputAccessoryView = toolBar
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    func doneClicked(){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.theScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.theScrollView.contentInset = contentInset
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
