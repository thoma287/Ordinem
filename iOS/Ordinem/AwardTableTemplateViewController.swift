//
//  AwardTableTemplateViewController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/20/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class AwardTableTemplateViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate {


    @IBOutlet weak var imageReward: UIImageView!
    @IBOutlet weak var buttonImage: UIButton!
    @IBAction func buttonImageTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageReward.image = image
        self.dismiss(animated: true, completion: nil);
    }
    
    func saveButt(sender: AnyObject) {
        let imageData = UIImageJPEGRepresentation(imageReward.image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
         let alert = UIAlertController(title: "Photo Added!", message: "Your photo has been added to the event", preferredStyle: .alert)
         self.present(alert, animated: true, completion: nil)
        
        }
    }

    @IBOutlet weak var AwardTitle: UITextField!
    @IBOutlet weak var minimumPts: UITextField!
    @IBOutlet weak var numberBeingOffered: UITextField!
    @IBOutlet weak var pickupLocation: UITextField!
    @IBOutlet weak var closureTimeDate: UITextField!
    @IBOutlet weak var RaffleVsWin: UISegmentedControl!
    
    @IBOutlet weak var theScrollView: UIScrollView!
    
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if(AwardTitle.text == "" || minimumPts.text == "" || numberBeingOffered.text == "" || pickupLocation.text == "" || closureTimeDate.text == ""){
            let alert = UIAlertController(title: "Error", message: "All text fields must be entered", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)

            
        }
        else{
        
        if(RaffleVsWin.selectedSegmentIndex == 0){
        let award = AdminAwardController()
        
        award.image = imageReward
        award.name = AwardTitle.text!
        award.points = Int(minimumPts.text!)!
        award.total = Int(numberBeingOffered.text!)!
        award.location = pickupLocation.text!
        //Damn dates
        //award.dateClose = DateFormatter(closureTimeDate.text!)!
        award.raffleVAWin = RaffleVsWin.selectedSegmentIndex
        }
        else{
            let award = AdminRaffleController()
            
            award.image = imageReward
            award.name = AwardTitle.text!
            award.points = Int(minimumPts.text!)!
            award.total = Int(numberBeingOffered.text!)!
            award.location = pickupLocation.text!
            //Damn dates
            //award.dateClose = DateFormatter(closureTimeDate.text!)!
            award.raffleVAWin = RaffleVsWin.selectedSegmentIndex
            }
        }
    }
    
    func saved(){
        let award = AdminAwardController()
        
        award.image = imageReward
        award.name = AwardTitle.text!
        award.points = Int(minimumPts.text!)!
        award.total = Int(numberBeingOffered.text!)!
        award.location = pickupLocation.text!
        //Damn dates
        //award.dateClose = DateFormatter(closureTimeDate.text!)!
        award.raffleVAWin = RaffleVsWin.selectedSegmentIndex
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == AwardTitle{
            minimumPts.becomeFirstResponder()
        }
        else if textField == minimumPts{
            numberBeingOffered.becomeFirstResponder()
        }
        else if textField == numberBeingOffered{
            pickupLocation.becomeFirstResponder()
        }
        else if textField == pickupLocation{
            closureTimeDate.becomeFirstResponder()
        }
        else{
            closureTimeDate.resignFirstResponder()
        }
        
        closureTimeDate.resignFirstResponder()
        
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TAB BAR FOR KEYBOARD
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        AwardTitle.inputAccessoryView = toolBar
        minimumPts.inputAccessoryView = toolBar
        numberBeingOffered.inputAccessoryView = toolBar
        pickupLocation.inputAccessoryView = toolBar
        closureTimeDate.inputAccessoryView = toolBar
        
        
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
        
        closureTimeDate.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TextField Delegate
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        closureTimeDate.text = formatter.string(from: sender.date)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    }

    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }

    
    
    
    
    
    func doneClicked(){
        view.endEditing(true)
    }

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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
