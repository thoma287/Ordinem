//
//  UserProfileMenu.swift
//  Ordinem
//
//  Created by Drew Thomas on 11/25/16.
//  Copyright © 2016 Ordinem. All rights reserved.
//

import UIKit

class UserProfileMenu: UITableViewController, UISplitViewControllerDelegate {

    var array : NSMutableArray! = NSMutableArray()
    
    let menuItems : [String] = ["Notifications3", "News Feed1", "Profile4",  "2Subscriptions", "Circle", "Connect with Facebook", "Edit Profile", "Settings"]
    
    override func viewDidLoad() {
        self.array.addObjects(from: menuItems)
        
        self.tableView.reloadData()
        
        self.splitViewController?.delegate = self
        
        self.splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.primaryOverlay
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "menu", for: indexPath) 
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let index = self.tableView.indexPathForSelectedRow! as IndexPath
            
            let nav = segue.destination as! UINavigationController
            
            let vc = nav.viewControllers[0] as! UserProfileInfo
            
            vc.title = self.array.object(at: index.row) as? String
            
            self.tableView.deselectRow(at: index, animated: true)
            
        }
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    
    
    
    
    
    
    
    

}
