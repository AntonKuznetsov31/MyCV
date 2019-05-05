//
//  ViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/18/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let personalVCtext = """
Here are some of my interests.
Scroll. Tap.
"""
    
    // Model access
    let hobby = Hobby()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = personalVCtext
        
    }
    
    // To show intro only once we need to save some mark in user defaults
    // And check it every time when user visits our app
    override func viewDidAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        let wasIntroWatched = userDefaults.bool(forKey: "wasIntroWatched")
        
        guard !wasIntroWatched else { return }
        
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController {
            present(pageViewController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hobby.hobbiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hobbyCell") as! HobbyTableViewCell
        
        let hobbyToShow = hobby.hobbiesArray[indexPath.row]
        cell.hobbyLabel.text = hobbyToShow.rawValue
        cell.hobbyImage.image = UIImage(named: hobbyToShow.image())
        return cell
    }
    
    // MARK: - UITableViewDataDelegate
    
    // When user choose some hobby we need to show table view or collection view depends on user's choice
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0,1,2:
            if let hobbyDetailTableVC = storyboard.instantiateViewController(withIdentifier: "hobbyDetailTableVC") as? HobbyDetailTableViewController {
                hobbyDetailTableVC.hobby = hobby.hobbiesArray[indexPath.row]
                navigationController?.pushViewController(hobbyDetailTableVC, animated: true)
            }
        case 3,4:
            if let hobbyDetailCollectionVC = storyboard.instantiateViewController(withIdentifier: "hobbyDetailCollectionVC") as? HobbyDetailCollectionViewController {
                hobbyDetailCollectionVC.hobby = hobby.hobbiesArray[indexPath.row]
                navigationController?.pushViewController(hobbyDetailCollectionVC, animated: true)
            }
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
