//
//  NewOrgSignUp.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/11/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewOrgSignUp: UIViewController {
    
    
    @IBOutlet weak var OrgName: UITextField!
//Need Drop down box for type of Organization
    @IBOutlet weak var OrgType: UITextField!
//Need Drop down Box
    @IBOutlet weak var OrgSchool: UITextField!
    
    @IBOutlet weak var OrgEmail: UITextField!
    
    @IBOutlet weak var OrgPassword: UITextField!
    
    @IBOutlet weak var OrgVerifyPassword: UITextField!
    
    
    //Gets Organization Name
    func getOrgName() -> String{
        let oName = self.OrgName.text
        return oName!
    }
    
    
    func getOrgType() -> String{
        let oType = self.OrgType.text
        return oType!
    }
    
    func getOrgEmail() -> String{
        let oEmail = self.OrgEmail.text
        return oEmail!
    }
    
    func getOrgPassword() -> String{
        let oPassword = self.OrgPassword.text
        return oPassword!
    }
    
    func verifyPassword() -> Bool{
        if(OrgPassword == OrgVerifyPassword){
            return true
        }
        else{
            return false
        }
    }
    
    
    
    
    
}
