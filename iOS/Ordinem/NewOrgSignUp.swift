//
//  NewOrgSignUp.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/11/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewOrgSignUp: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var OrgName: UITextField!
//Need Drop down box for type of Organization
    @IBOutlet weak var OrgType: UITextField!
//Need Drop down Box
    @IBOutlet weak var OrgSchool: UITextField!
    
    @IBOutlet weak var OrgEmail: UITextField!
    
    @IBOutlet weak var OrgPassword: UITextField!
    
    @IBOutlet weak var OrgVerifyPassword: UITextField!
    
    
    //Gets Organization Name
    func getOrgName() -> String{
        let oName = self.OrgName.text
        return oName!
    }
    
    
    func getOrgType() -> String{
        let oType = self.OrgType.text
        return oType!
    }
    
    func getOrgEmail() -> String{
        let oEmail = self.OrgEmail.text
        return oEmail!
    }
    
    func getOrgPassword() -> String{
        let oPassword = self.OrgPassword.text
        return oPassword!
    }
    
    func verifyPassword() -> Bool{
        if(OrgPassword == OrgVerifyPassword){
            return true
        }
        else{
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrgSchool.delegate = self.OrgSchool as! UITextFieldDelegate?
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TextField Delegate
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        OrgSchool.text = formatter.string(from: sender.date)
        
        print("Try this at home")
    }
    
    private func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        
        print("This Worked")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        OrgSchool.resignFirstResponder()
        return true
    }
    
    // MARK: Helper Methods
    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
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

