//
//  CreateNewUser.swift
//  Ordinem
//
//  Created by Corey Lowe on 11/10/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var CAUserFirstName: UITextField!
    @IBOutlet weak var CAUserLastName: UITextField!
    @IBOutlet weak var CAUserPassword: UITextField!
    @IBOutlet weak var CAUserStudentID: UITextField!
    @IBOutlet weak var CAUserSchoolEmail: UITextField!
    
    
    
    
    //Takes in First Name
    func getFirstName() -> String {
        
        let inputFirstName = self.CAUserFirstName.text
        return inputFirstName!
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usrCASchoolActualPicker.isHidden = true
        usrCASchoolTextBox.text = list[0]

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
        
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        usrCASchoolTextBox.text = list[row]
        usrCASchoolActualPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) -> Bool{
        if textField == self.usrCASchoolTextBox{
            self.usrCASchoolActualPicker.isHidden = false
            textField.endEditing(true)
           
        }
        return false
    }
}
