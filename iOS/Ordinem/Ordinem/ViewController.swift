//
//  ViewController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/10/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var btn_sign_up: UIButton!  //USER SIGN UP
    @IBOutlet weak var SchoolLoginPicker: UIPickerView!
    @IBOutlet weak var OrgSignUpButton: UIButton! //ORG SIGN UP
    

    
    var pickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //TAB BAR FOR KEYBOARD
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        LoginSchoolEmail.inputAccessoryView = toolBar
        LoginPassword.inputAccessoryView = toolBar

        
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        

        
        
        // Connect data:
        self.SchoolLoginPicker.delegate = self
        self.SchoolLoginPicker.dataSource = self
        
        // Input data into the Array:
        pickerData = ["Chapman", "UCI", "USC", "UCSB", "UCSB", "UCR"]
        
        
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
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    //LOGIN SCHOOL EMAIL
    
    
    @IBOutlet weak var LoginSchoolEmail: UITextField!
    
    @IBOutlet weak var LoginPassword: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == LoginSchoolEmail{
            LoginPassword.becomeFirstResponder()
        }
        else{
            LoginPassword.resignFirstResponder()
        }
        return true

    }
    @IBOutlet weak var LoginUserVsOrg: UISegmentedControl!
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        
        if (LoginUserVsOrg.selectedSegmentIndex == 1 && LoginSchoolEmail.text == "a" && LoginPassword.text == "a")
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let adminReward = storyboard.instantiateViewController(withIdentifier: "AwardTableTemplateViewController")
            present(adminReward, animated: true, completion: nil)
        }
        else if LoginUserVsOrg.selectedSegmentIndex == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newsFeedVC = storyboard.instantiateViewController(withIdentifier: "UserNewsFeed")
            present(newsFeedVC, animated: true, completion: nil)        }
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newsFeedVC = storyboard.instantiateViewController(withIdentifier: "OrgNewsFeed")
            present(newsFeedVC, animated: true, completion: nil)        }
        
        
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

    
    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
    
    
    
    
    
    
    
    
    
}

