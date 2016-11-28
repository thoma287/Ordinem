//
//  OrgProfileDetails.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/27/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class OrgProfileDetails: UIViewController {

    @IBOutlet weak var eventPic: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventHost: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventPplGoing: UILabel!
    @IBOutlet weak var eventViewAttendees: UIButton!
    @IBOutlet weak var eventViewDescription: UITextView!
    
    @IBOutlet weak var eventRSVP: UIButton!
    @IBOutlet weak var rsvpDLabel: UILabel!
    
    

    @IBAction func rsvpButtonPressed(_ sender: Any) {
        
        eventRSVP.isHidden = true
        rsvpDLabel.isHidden = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rsvpDLabel.isHidden = true

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
