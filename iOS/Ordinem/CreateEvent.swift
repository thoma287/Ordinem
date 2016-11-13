//
//  CreateEvent.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/12/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class CreateEvent: UIViewController, UITextFieldDelegate {

    @IBAction func Cancel(_ sender: UIButton) {
        closeKeyBoard()
    }

    @IBAction func AddEvent(_ sender: UIButton) {
        closeKeyBoard()
    }
    //Start Time/Date
    @IBOutlet weak var DateOfEvent: UITextField!
    //End Time/Date
    @IBOutlet weak var EndDateOfEvent: UITextField!
    //Designates the number of points allocated
    @IBOutlet weak var PointStepper: UIStepper!
    //Visualizes the number of points
    @IBOutlet weak var PointStepperLabel: UILabel!
    
    //Type OF EVENT TEXTBOX
    @IBOutlet weak var textBoxTypeOfData: UITextField!
    //TYPE OF EVENTS
    @IBOutlet weak var TypeofEvents: UIPickerView!
    
    var list_of_events = ["First","Second","Third"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component : Int) -> Int{
        return list_of_events.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        self.view.endEditing(true)
        return list_of_events[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textBoxTypeOfData.text = self.list_of_events[row]
        self.TypeofEvents.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DateOfEvent.delegate = self
        
        
        PointStepper.maximumValue = 10
        PointStepper.stepValue = 1
        
        
        
    }
    //TEXT FIELD DELEGATE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func closeKeyBoard(){
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let DatePicker = UIDatePicker()
        textField.inputView = DatePicker
        
        DatePicker.addTarget( self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        
        if textField == self.textBoxTypeOfData {
            self.TypeofEvents.isHidden = false
        }
    }
    
    func datePickerChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        DateOfEvent.text = formatter.string(from: sender.date)
        
        
    }
    
    //TOUCH EVENT
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeKeyBoard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ActionPointStepper(_ sender: UIStepper) {
        
        PointStepperLabel.text = String(Int(sender.value))
    }
    
    
    
}
