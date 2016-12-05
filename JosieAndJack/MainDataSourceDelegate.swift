//
//  MainTableViewDataSourceDelegate.swift
//  JosieAndJack
//
//  Created by James Wilson on 12/4/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.StoryboardIds.CellReuseIds.main, for: indexPath) as? MainCell else {
            print("ERROR")
            return UITableViewCell()
        }
        
        cell.title.text = "hello world"
        
        return cell
    }

    
    
    
    
}