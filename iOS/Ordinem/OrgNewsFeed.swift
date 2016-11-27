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
    @IBOutlet weak var orgRSVPd: UILabel!
    @IBOutlet weak var RSVPbutton: UIButton!
    
    @IBOutlet weak var rsvpDlabel: UILabel!
    
    
    
    @IBAction func rsvpButtonPressed(_ sender: Any) {
        RSVPbutton.isHidden = true
        rsvpDlabel.isHidden = false
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rsvpDlabel.isHidden = true
        
        RSVPbutton.backgroundColor = .clear
        RSVPbutton.layer.cornerRadius = 5
        RSVPbutton.layer.borderWidth = 1
        RSVPbutton.layer.borderColor = UIColor.black.cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
