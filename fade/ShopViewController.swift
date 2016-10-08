//
//  ShopViewController.swift
//  fade
//
//  Created by Ishan Gupta on 10/7/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var shotListNames = ["Fade Cuts", "San Jose Cuts", "Fresh Cuts", "Always Cuts"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shotListNames.count
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCellTableViewCell
        
        cell.shopTitle.text = shotListNames[indexPath.row]
        
        return cell
        
    }
    
}
