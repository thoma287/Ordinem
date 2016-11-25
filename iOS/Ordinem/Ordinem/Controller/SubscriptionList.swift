//
//  SubscriptionList.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/25/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class SubscriptionList: UITableViewController {

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


class SubscriptionCell : UITableViewCell{
    
    
    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    
    
    
    
    
    
    
    
}
