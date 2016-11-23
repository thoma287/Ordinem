//
//  VerificationController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/23/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class VerificationController: UIViewController {
    private var _esig = ""
    private var _password = ""
    
    var esig: String{
        get{
            return _esig
        }
        set{
            _esig = newValue
        }
    }
    
    var password: String{
        get{
            return _password
        }
        set{
            _password = newValue
        }
    }

}
