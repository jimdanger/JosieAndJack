//
//  MainVC.swift
//  JosieAndJack
//
//  Created by James Wilson on 12/4/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class MainVC: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataSourceAndDelegate: MainDataSourceDelegate!
    var selectedKid: Kid?
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSourceAndDelegate.kids = Session.instance.fetchAll()
        dataSourceAndDelegate.mainView = self
        tableView.dataSource = dataSourceAndDelegate
        tableView.delegate = dataSourceAndDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func goToDetail(kid: Kid) {
        selectedKid = kid
        performSegue(withIdentifier: Constants.StoryboardIds.Segues.next.rawValue, sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vc = segue.destination as? DetailVC {
            if let thisKid = selectedKid {
                vc.kid = thisKid
            }
        }
    }

}
