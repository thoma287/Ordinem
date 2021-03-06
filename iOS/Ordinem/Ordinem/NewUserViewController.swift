//
//  CreateNewUser.swift
//  Ordinem
//
//  Created by Corey Lowe on 11/10/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var CAUserFirstName: UITextField!
    @IBOutlet weak var CAUserLastName: UITextField!
    @IBOutlet weak var CAUserPassword: UITextField!
    @IBOutlet weak var CAUserStudentID: UITextField!
    @IBOutlet weak var CAUserSchoolEmail: UITextField!
    @IBOutlet weak var CAUserVerifyPwd: UITextField!
    @IBOutlet weak var usrCASchoolTextBox: UITextField!

    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        if(CAUserFirstName.text! == "" || CAUserLastName.text! == "" || CAUserPassword.text! == "" || CAUserStudentID.text! == "" || CAUserSchoolEmail.text! == "" || CAUserVerifyPwd.text! == "" || usrCASchoolTextBox.text! == ""){
            
            let alert = UIAlertController(title: "Error", message: "All text fields must be filled", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else{
        let connect = UserController()
        
        connect.name = CAUserFirstName.text!
        connect.lastName = CAUserLastName.text!
        connect.school = usrCASchoolTextBox.text!
        connect.email = CAUserSchoolEmail.text!
        connect.id = Int(CAUserStudentID.text!)!
        connect.password = CAUserPassword.text!
        connect.vPassword = CAUserVerifyPwd.text!
        }
    }
    
    
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
    
    var list = ["Chapman"]
    var picker = UIPickerView()

    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return list.count
    }
    

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        usrCASchoolTextBox.text = list[row]
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    

    

    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        usrCASchoolTextBox.inputView = picker
        
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        CAUserFirstName.inputAccessoryView = toolBar
        CAUserLastName.inputAccessoryView = toolBar
        CAUserStudentID.inputAccessoryView = toolBar
        usrCASchoolTextBox.inputAccessoryView = toolBar
        CAUserSchoolEmail.inputAccessoryView = toolBar
        CAUserPassword.inputAccessoryView = toolBar
        CAUserVerifyPwd.inputAccessoryView = toolBar
        
        
        
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
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == CAUserFirstName{
            CAUserLastName.becomeFirstResponder()
        }
        else if textField == CAUserLastName{
            CAUserStudentID.becomeFirstResponder()
        }
        else if textField == CAUserStudentID{
            usrCASchoolTextBox.becomeFirstResponder()
        }
        else if textField == usrCASchoolTextBox{
            CAUserSchoolEmail.becomeFirstResponder()
        }
        else if textField == CAUserSchoolEmail{
            CAUserPassword.becomeFirstResponder()
        }
        else if textField == CAUserPassword{
            CAUserVerifyPwd.becomeFirstResponder()
        }
        else{
            CAUserVerifyPwd.resignFirstResponder()
        }
        return true
    }

    

    

}
