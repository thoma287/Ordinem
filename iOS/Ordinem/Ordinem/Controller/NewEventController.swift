//
//  NewEventController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/22/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class NewEventController: UIViewController {
    
    private var _name = String()
    private var _image = UIImage()
    private var _sTime = DateFormatter()
    private var _eTime = DateFormatter()
    private var _location = ""
    private var _eTitle = ""
    private var _type = ""
    private var _points = Int(0)
    
    
    var image : UIImage{
    get{
        return _image
    }
    set{
        _image = newValue
    }
        
    }
    var sTime : DateFormatter{
        get{
            return _sTime
        }
        set{
            _sTime = newValue
        }
    }
    
    var eTime : DateFormatter{
        get{
            return _eTime
        }
        set{
            _eTime = newValue
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
    
    var eTitle : String{
        get{
            return _eTitle
        }
        set{
            _eTitle = newValue
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
    
    var type : String{
        get{
            return _type
        }
        set{
            _type = newValue
        }
    }
    
    var name : String{
        get{
            return _name
        }
        set{
            let x = OrgController()
            let r = x.name
            _name = r
        }
    }
    
    func getEverything() -> String{
        return "\(name) \(image) \(sTime) \(eTime) \(location) \(eTitle) \(points)"
    }
    

}
