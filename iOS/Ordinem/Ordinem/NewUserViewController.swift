//
//  CreateNewUser.swift
//  Ordinem
//
//  Created by Corey Lowe on 11/10/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController{
    
    
    @IBOutlet weak var CAUserFirstName: UITextField!
    @IBOutlet weak var CAUserLastName: UITextField!
    @IBOutlet weak var CAUserPassword: UITextField!
    @IBOutlet weak var CAUserStudentID: UITextField!
    @IBOutlet weak var CAUserSchoolEmail: UITextField!
    @IBOutlet weak var CAUserVerifyPwd: UITextField!
    

    
    
    //Takes in Last Name
    func getLastName() -> String {
        
        let inputLastName = self.CAUserLastName.text
        return inputLastName!
    }
    
    //Takes in User Password
    func getUserPasword() -> String{
        let inputPassword = self.CAUserPassword.text
        return inputPassword!
    }
    
    //Takes in User Email
    func getUserEmail() -> String{
        let inputEmail = self.CAUserSchoolEmail.text
        return inputEmail!
    }
    
    //Takes in Student ID
    func getStudentID() -> Int{
        let inputID:Int? = Int(self.CAUserStudentID.text!)
        return inputID!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usrCASchoolActualPicker.isHidden = true
        usrCASchoolTextBox.text = list[0]
        
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        CAUserFirstName.inputAccessoryView = toolBar
        CAUserLastName.inputAccessoryView = toolBar
        CAUserStudentID.inputAccessoryView = toolBar
        usrCASchoolTextBox.inputAccessoryView = toolBar
        CAUserSchoolEmail.inputAccessoryView = toolBar
        CAUserPassword.inputAccessoryView = toolBar
        CAUserVerifyPwd.inputAccessoryView = toolBar
        
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        
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
    
    var list = ["Chapman","UCSB"]
    
    //Actual Picker
    @IBOutlet var usrCASchoolActualPicker: UIPickerView! = UIPickerView()
    //Text field for picker

    @IBOutlet weak var usrCASchoolTextBox: UITextField!
    


    
    //PICKER FOR SCHOOL STILL NOT WORKING
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        usrCASchoolTextBox.text = list[row]
        usrCASchoolActualPicker.isHidden = true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
            self.usrCASchoolActualPicker.isHidden = false
            textField.endEditing(true)
        
            return false
    }
}
