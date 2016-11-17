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
        
        
        
        // Connect data:
        self.SchoolLoginPicker.delegate = self
        self.SchoolLoginPicker.dataSource = self
        
        // Input data into the Array:
        pickerData = ["Chapman", "UCI", "USC", "UCSB", "UCSB", "UCR"]
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
    
    @IBOutlet weak var LoginSchoolPicker: UIPickerView!
    
    @IBOutlet weak var LoginSchoolEmail: UITextField!
    
    @IBOutlet weak var LoginPassword: UITextField!
    
    
    @IBOutlet weak var LoginUserVsOrg: UISegmentedControl!
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        if LoginUserVsOrg.selectedSegmentIndex == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newsFeedVC = storyboard.instantiateViewController(withIdentifier: "UserNewsFeed")
            present(newsFeedVC, animated: true, completion: nil)        }
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newsFeedVC = storyboard.instantiateViewController(withIdentifier: "OrgNewsFeed")
            present(newsFeedVC, animated: true, completion: nil)        }
        
        
    }
    
    

    
    
    
}

