//
//  UserCashTable.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/14/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class UserCashTable: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

class RewardTableCell : UITableViewCell{
    
    @IBOutlet weak var CashButton: UIButton!
    
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var PointsEnteredinStepperCompareToAwards: UILabel!
    @IBOutlet weak var rewardConversionFromPoints: UILabel!
    @IBOutlet weak var minimumPoints: UILabel!
    @IBOutlet weak var PointsEnteredinStepper: UILabel!
    @IBOutlet weak var pointStepper: UIStepper!
    
    
    
    
    }
