//
//  FirstViewController.swift
//  To do list
//
//  Created by Bryan on 7/31/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var toDoListTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {

        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    internal func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
            
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }
}

