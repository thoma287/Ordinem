//
//  CreateNewUser.swift
//  Ordinem
//
//  Created by Corey Lowe on 11/10/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
    
    
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
    
    
    

    var list = ["Chapman","UCSB"]
    
    //Actual Picker
    @IBOutlet weak var usrCASchoolActualPicker: UIPickerView!
    //Text field for picker
    @IBOutlet weak var usrCASchoolPicker: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //PICKER FOR SCHOOL STILL NOT WORKING
    func numberOfComponenetsInPickerView(pickerView: UIPickerView)-> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponenet component: Int)-> Int{
        return list.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.usrCASchoolPicker.text = self.list[row]
        self.usrCASchoolActualPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        if textField == self.usrCASchoolPicker{
            self.usrCASchoolActualPicker.isHidden = true
        }
        
    }
}
