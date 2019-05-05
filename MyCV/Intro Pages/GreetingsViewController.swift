//
//  GreetingsViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/19/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class GreetingsViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var index = 0
    var text = ""
    var imageName = ""
    var pagesCount = 0
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        switch index {
        case 0,1,2:
            let pageViewController = parent as! PageViewController
            pageViewController.showNextViewController(atIndex: index)
        case 3:
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "wasIntroWatched")
            userDefaults.synchronize()
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        
        pageControl.numberOfPages = pagesCount
        pageControl.currentPage = index
        image.image = UIImage(named: imageName)
        label.text = text
        
        switch index {
        case 3: button.setTitle("Done", for: .normal)
        default:
            break
        }
    }
}
