//
//  CircleProfile.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/27/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class CircleProfile: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileFirstAndLast: UILabel!
    @IBOutlet weak var mutualFriends: UIButton!

    @IBOutlet weak var profileCaption: UILabel!
    @IBOutlet weak var joinCircleRequest: UIButton!
    
    @IBOutlet weak var rsvpdLabel: UILabel!
    
    @IBAction func requestCirclePressed(_ sender: Any) {
        joinCircleRequest.isHidden = true
        rsvpdLabel.isHidden = false
        
        
    }
    
    override func viewDidLoad() {
        rsvpdLabel.isHidden = true
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
