//
//  PointCalculatorController.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/24/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class PointCalculatorController: UIViewController {

    private var _points = Int(0)
    private var _verifiedPoints = Int(0)
    
    var points : Int{
        get{
            return _points
        }
        set{
            _points = newValue
        }
    }
    
    var verifiedPoints : Int{
        get{
            return _verifiedPoints
        }
        set{
            _verifiedPoints = newValue
        }
    }

}
