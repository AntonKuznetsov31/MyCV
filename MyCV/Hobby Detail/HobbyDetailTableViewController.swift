//
//  HobbyTableViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/22/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class HobbyDetailTableViewController: UITableViewController {
    
    // Hobby type
    var hobby = Hobby.MyHobby(rawValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = hobby?.values().count else { return 0 }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! HobbyDetailTableViewCell
        
        if let hobbyDetailsNames = hobby?.values() {
            cell.hobbyLabel.text = hobbyDetailsNames[indexPath.row]
        }
        
        return cell
    }
}
