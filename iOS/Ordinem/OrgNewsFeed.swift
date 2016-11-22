//
//  OrgNewsFeed.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/13/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

struct cellData {
    let OrgImage = UIImage()
    let OrgName = String()
    let OrgEventTitle = String()
    let OrgEventTime = String()
    let orgPoitnsTitleOnly = Int()
    
}

class OrgNewsFeed: UITableViewController {

    

    
    
}




class OrgNewsFeedCell : UITableViewCell{
    
    
    @IBOutlet weak var OrgImage: UIImageView!
    @IBOutlet weak var OrgName: UILabel!
    @IBOutlet weak var OrgEventTitle: UILabel!
    @IBOutlet weak var OrgEventTime: UILabel!
    @IBOutlet weak var OrgPointsTitleOnly: UILabel!
    @IBOutlet weak var OrgPointsToBeAwarded: UILabel!
    @IBOutlet weak var OrgEventLocation: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
