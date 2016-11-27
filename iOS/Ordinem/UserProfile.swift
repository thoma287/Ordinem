//
//  UserProfile.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/27/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class UserProfile: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileFirstLastName: UILabel!
    @IBOutlet weak var profileCurrentPoints: UILabel!
    @IBOutlet weak var profileCaption: UILabel!
    
    
    
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
