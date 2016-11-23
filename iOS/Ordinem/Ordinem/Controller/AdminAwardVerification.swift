//
//  AdminAwardVerification.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/23/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class AdminAwardVerification: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var eSignature: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        let adminVerification = LoginController()
        let submissionConfirmed = VerificationController()
        
        let pwd = adminVerification.password
        
        submissionConfirmed.password = password.text!
        if(pwd == submissionConfirmed.password){
            submissionConfirmed.esig = eSignature.text!
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Password incorrect", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }

        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
