//
//  ViewController.swift
//  ScrollableBackgroundImageView-Sample
//
//  Created by ishimaru on 2015/03/05.
//  Copyright (c) 2015 shoya140. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 20
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("Blank", forIndexPath: indexPath) as! UITableViewCell
            cell.backgroundColor = UIColor.clearColor()
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel!.text = "Cell \(indexPath.row)"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 50
        }
    }
    
    // MARK: - Scroll view
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        var scrollOffset: CGFloat
        if offset < 0 {
            scrollOffset = scrollView.contentOffset.y/3
        }else{
            scrollOffset = scrollView.contentOffset.y
        }
        self.backgroundScrollView.setContentOffset(CGPointMake(self.backgroundScrollView.contentOffset.x, scrollOffset), animated: false)
    }
    
}