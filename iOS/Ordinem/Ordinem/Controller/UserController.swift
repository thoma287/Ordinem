//
//  UserController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/22/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class UserController: UIViewController {

    private var _name = ""
    private var _lastName = ""
    private var _id = Int(0)
    private var _school = ""
    private var _email = ""
    private var _password = ""
    private var _vPassword = ""

    var name: String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var lastName: String{
        get{
            return _lastName
        }
        set{
            _lastName = newValue
        }
    }
    
    var id : Int{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    
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
    
    var vPassword : String{
        get{
            return _vPassword
        }
        set{
            _vPassword = newValue
        }
    }
    func getAllInfo() -> String {
        return "\(name) \(lastName) \(school) \(email) \(password) \(id)"
    }

}
