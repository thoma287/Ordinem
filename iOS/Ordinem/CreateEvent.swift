//
//  CreateEvent.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/12/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class CreateEvent: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

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
        
    }
    
    
    @IBAction func PublishButtonClicked(_ sender: Any) {
        if (DateOfEvent.text! == "" && EndDateOfEvent.text! == "" && LocationOfEvent.text! == "" && eventTitle.text! == "") {
            
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
        textBoxTypeOfData.text = list[row]
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Type of Event
        picker.delegate = self
        picker.dataSource = self
        textBoxTypeOfData.inputView = picker
        
        DateOfEvent.delegate = self
        
        
        PointStepper.maximumValue = 10
        PointStepper.stepValue = 1
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        
        DateOfEvent.inputAccessoryView = toolBar
        EndDateOfEvent.inputAccessoryView = toolBar
        LocationOfEvent.inputAccessoryView = toolBar
        eventTitle.inputAccessoryView = toolBar
        textBoxTypeOfData.inputAccessoryView = toolBar

        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    //TEXT FIELD DELEGATE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == DateOfEvent{
        EndDateOfEvent.becomeFirstResponder()
    }
    else if textField == EndDateOfEvent{
        LocationOfEvent.becomeFirstResponder()
    }
    else if textField == LocationOfEvent{
        eventTitle.becomeFirstResponder()
    }
    else if textField == eventTitle{
        textBoxTypeOfData.becomeFirstResponder()
    }
    else{
        self.closeKeyBoard()
        }
    return true
    }
    
    func closeKeyBoard(){
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let DatePicker = UIDatePicker()
        textField.inputView = DatePicker
        
        DatePicker.addTarget( self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
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
    
    func doneClicked(){
        view.endEditing(true)
    }
    
    @IBOutlet weak var theScrollView: UIScrollView!
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = theScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        theScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        theScrollView.contentInset = contentInset
    }
    
    
}
