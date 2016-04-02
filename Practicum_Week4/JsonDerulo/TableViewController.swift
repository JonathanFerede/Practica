//
//  TableViewController.swift
//  JsonDerulo
//
//  Created by Fhict on 28/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import UIKit



class TableViewController: UITableViewController {
    
    var pirates = [Pirate]()
    
    func loadJsonData()
    {
        let url = NSURL(string: "http://athena.fhict.nl/users/i886625/pirates.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do
            {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, 	   options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJsonData(jsonObject)
                }
            }
            catch
            {
                print("Error parsing JSON data")
            }
        }
        dataTask.resume();
    }
    
    func parseJsonData(jsonObject:AnyObject)
    {
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let newPirate = Pirate(
                    name: item.objectForKey("name") as! String,
                    life: item.objectForKey("life")as! String,
                    years_active: item.objectForKey("years_active") as! String,
                    country_of_origin: item.objectForKey("country_of_origin") as! String,
                    comments: item.objectForKey("comments") as! String
                )
                pirates.append(newPirate);
            }
            
            self.tableView.reloadData();
        }
        
    
    }
    
    override func viewDidLoad() {
        print("View is geladen")
        super.viewDidLoad()
        //Laad eerst de JsonData voor dat de ViewController getoond word
        self.loadJsonData()
        print("Json is geladen")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("er zijn ",pirates.count," piraten gevonden")
        return pirates.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Ik ga de cellen invullen")
        print(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        //Set the correct value in this cell
        var currentRow = indexPath.row
        var currentPirate = self.pirates[currentRow]
        
        //set the text in the cell
        cell.textLabel?.text = currentPirate.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var selectedRow = self.tableView.indexPathForSelectedRow
        var selectedPirate = self.pirates[selectedRow!.row]
        
        //Pass the selected pirate to the next viewcontroller
        var controller = segue.destinationViewController as! DetailsViewController
        controller.selectedPirate = selectedPirate
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
