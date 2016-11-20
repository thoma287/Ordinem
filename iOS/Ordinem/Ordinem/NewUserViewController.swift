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
    @IBOutlet weak var usrCASchoolTextBox: UITextField!

    
    
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
    

    

    

}
