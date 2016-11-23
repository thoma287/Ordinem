//
//  AdminAwardController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/23/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class AdminAwardController: UIViewController {

    private var _image = UIImageView()
    private var _name = ""
    private var _points = Int(0)
    private var _total = Int(0)
    private var _location = ""
    private var _dateClose = DateFormatter()
    private var _raffleVAWin = Int(0)
    
    var image : UIImageView{
        get{
            return _image
        }
        set{
            _image = newValue
        }
    }
    
    var name : String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var points : Int{
        get{
            return _points
        }
        set{
            _points = newValue
        }
    }
    
    var total : Int{
        get{
            return _total
        }
        set{
            _total = newValue
        }
    }
    
    var location : String{
        get{
            return _location
        }
        set{
            _location = newValue
        }
    }
    
    var dateClose : DateFormatter{
        get{
            return _dateClose
        }
        set{
            _dateClose = newValue
        }
    }
    
    var raffleVAWin : Int{
        get{
            return _raffleVAWin
        }
        set{
            _raffleVAWin = newValue
        }
    }
    
    func getTodos() -> String{
        return "\(name) \(points) \(total) \(location) \(dateClose) \(raffleVAWin)"
    }
    
    

}
