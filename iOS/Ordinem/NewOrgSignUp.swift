//
//  NewOrgSignUp.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/11/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewOrgSignUp: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var OrgName: UITextField!
//Need Drop down box for type of Organization
    @IBOutlet weak var OrgType: UITextField!
//Need Drop down Box
    @IBOutlet weak var OrgSchool: UITextField!
    
    @IBOutlet weak var OrgEmail: UITextField!
    
    @IBOutlet weak var OrgPassword: UITextField!
    
    @IBOutlet weak var OrgVerifyPassword: UITextField!
    
    @IBOutlet weak var OrgSchoolID: UITextField!
    
    @IBOutlet weak var OrgTypeOptions: UIPickerView!
    
    
    func getOrgID() -> Int{
        let oID:Int! = Int(self.OrgSchoolID.text!)
        return oID
    }
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
    
    
    
    var list = ["Chapman"]
    var picker1 = UIPickerView()
    
    var types = ["Academic/Professional", "Civic Engagement","Diversity/ Cultural","Greek","Honor Society","Sport", "Leisure", "Recreational","Religious/Spiritual"]
    
    var picker2 = UIPickerView()
    

    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView.tag == 0{
            return list.count
        }
        else{
            return types.count
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            OrgSchool.text = list[row]}
        else{OrgType.text = types[row]}
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return list[row]}
        else{
            return types[row]
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker1.tag = 0
        picker2.tag = 1
        
        picker1.delegate = self
        picker1.dataSource = self
        OrgSchool.inputView = picker1

        picker2.delegate = self
        picker2.dataSource = self
        OrgType.inputView = picker2
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let toolBar = UIToolbar()
 
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        

        OrgVerifyPassword.inputAccessoryView = toolBar
        OrgSchool.inputAccessoryView = toolBar
        OrgSchoolID.inputAccessoryView = toolBar
        OrgName.inputAccessoryView = toolBar
        OrgType.inputAccessoryView = toolBar
        OrgEmail.inputAccessoryView = toolBar
        OrgPassword.inputAccessoryView = toolBar

        
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
    func doneClicked(){
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var theScrollView: UIScrollView!
    
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TextField Delegate
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        OrgSchool.text = formatter.string(from: sender.date)
        
        
    }
    
    private func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == OrgName{
            OrgType.becomeFirstResponder()
        }
        else if textField == OrgType{
            OrgSchool.becomeFirstResponder()
        }
        else if textField == OrgSchool{
            OrgEmail.becomeFirstResponder()
        }
        else if textField == OrgEmail{
            OrgSchoolID.becomeFirstResponder()
        }
        else if textField == OrgSchoolID{
            OrgPassword.becomeFirstResponder()
        }
        else if textField == OrgPassword{
            OrgVerifyPassword.becomeFirstResponder()
        }
        else{
            self.closekeyboard()
        }
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

