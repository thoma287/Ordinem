//
//  OrgController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/22/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class OrgController: UIViewController {

    private var _name = ""
    private var _type = ""
    private var _school = ""
    private var _email = ""
    private var _password = ""
    private var _vPassword = ""
    private var _id = Int(0)
    
    
        
    var name: String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var type: String{
        get{
            return _type
        }
        set{
            _type = newValue
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
    
    var id : Int{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    
    func getAllInfo() -> String {
        return "\(name) \(type) \(school) \(email) \(password) \(id)"
    }
    
    
}
