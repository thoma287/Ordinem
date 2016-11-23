//
//  LoginController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/23/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    private var _school = ""
    private var _email = ""
    private var _password = ""
    private var _type = Int(0)
    
    var school : String{
        get{
            return _school
        }
        set{
            _school = newValue
        }
    }
    
    var email : String{
        get{
            return _email
        }
        set{
            _email = newValue
        }
    }
    
    var password : String{
        get{
            return _password
        }
        set{
            _password = newValue
        }
    }
    
    var type : Int{
        get{
            return _type
        }
        set{
            _type = newValue
        }
    }
    
    func getTodos() -> String{
        return "\(school) \(email) \(password) \(type)"
    }
    


}
