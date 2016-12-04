//
//  MainVC.swift
//  JosieAndJack
//
//  Created by James Wilson on 12/4/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class MainVC: UIViewController  {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataSourceAndDelegate: MainDataSourceDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSourceAndDelegate
        tableView.delegate = dataSourceAndDelegate
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
