//
//  OrgProfile.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/27/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class OrgProfile: UIViewController {

    
    @IBOutlet weak var orgPic: UIImageView!
    @IBOutlet weak var orgTitle: UILabel!
    @IBOutlet weak var orgSubscribe: UIButton!
    @IBOutlet weak var subscribedLabel: UILabel!
    
    @IBAction func subscribeButtonPressed(_ sender: Any) {
        orgSubscribe.isHidden = true
        subscribedLabel.isHidden = false
    }
    
    override func viewDidLoad() {
        subscribedLabel.isHidden = true
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
