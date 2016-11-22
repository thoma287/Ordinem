//
//  CreateEvent.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/12/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class CreateEvent: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    //ACTUAL IMAGE BEING CHANGED
    @IBOutlet weak var ChooseImage: UIImageView!
    //SELECT BUTTON TO CHANGE
    @IBOutlet weak var SelectImage: UIButton!
    


    @IBAction func SelectImageButtonSelected(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        ChooseImage.image = image
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func saveButt(sender: AnyObject) {
        let imageData = UIImageJPEGRepresentation(ChooseImage.image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Photo Added!", message: "Your photo has been added to the event", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @IBOutlet weak var LocationOfEvent: UITextField!
    
    
    
    
    
    
    
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
    //Event Title
    @IBOutlet weak var eventTitle: UITextField!
    
    var list_of_events = ["First","Second","Third"]
    
    
    //PICKER VIEW STUFF FOR EVENTS
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
    
    
    @IBAction func PublishButtonClicked(_ sender: Any) {
        if (DateOfEvent.text! == "" && EndDateOfEvent.text! == "" && LocationOfEvent.text! == "" && eventTitle.text! == "" && TypeofEvents.dataSource == nil) {
            
            //getting an error
           /*
             let buttonAlert = UIAlertController(title: "Error", message: "All text fields must be required", preferredStyle: .alert)
             self.present(buttonAlert, animated: true, completion: nil)
             */
        }
        else{
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newsFeedVC = storyboard.instantiateViewController(withIdentifier: "ESigAndConflictions")
            present(newsFeedVC, animated: true, completion: nil)
        }

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
    
    //TOUCH EVENT FOR STEPPER
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
