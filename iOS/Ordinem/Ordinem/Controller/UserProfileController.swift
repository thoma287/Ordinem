//
//  UserProfileController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/28/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class UserProfileController: UIViewController{
    
    private var _name = ""
    private var _image = UIImage()
    private var _caption = ""
    
    var name : String{
        get{
            return _name
        }
        set{
            let fullName = UserController()
            _name = "\(fullName.name) \(fullName.lastName)"
        }
    }
    
    var image : UIImage{
        get{
            return _image
        }
        set{
            _image = newValue
        }
    }
    
    var caption : String{
        get{
            return _caption
        }
        set{
            _caption = newValue
        }
    }
    
}

