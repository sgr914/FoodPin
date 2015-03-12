//
//  DetailViewController.swift
//  FoodPin
//
//  Created by sgr on 15/3/10.
//  Copyright (c) 2015年 com.cnipr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var restaurant: Restaurant!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = self.restaurant.name
        
        // Do any additional setup after loading the view.
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantImageView.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        
        cell.mapButton.hidden = true
        
        switch indexPath.row
        {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = restaurant.name
            case 1:
                cell.fieldLabel.text = "Type"
                cell.valueLabel.text = restaurant.type
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = restaurant.location
                cell.mapButton.hidden = false
            case 3:
                cell.fieldLabel.text = "Been here"
                cell.valueLabel.text = restaurant.isVisited ? "Yes, I’ve been here before" : "No"
            
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    

    
    // MARK: - Navigation

    @IBAction func close(segue: UIStoryboardSegue)
    {
    
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMap"
        {
            let destinationController = segue.destinationViewController as MapViewController
            
            destinationController.restaurant = restaurant
        }
        
        
    }
    

}
