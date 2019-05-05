//
//  PageViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/19/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let greetingsTextArray = [
        """
Hello!
My name is Anton.
This is my CV-app.
""",
        """
It will show you my iOS developer's skills.
""",
        """
Waiting for your feedback!
""",
        """
P.S.
In future I want to extend this app with new features.
"""
    ]
    
    let imagesArray = ["me", "successKid", "zhdun", "ps"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let firstViewController = showViewController(atIndex: 0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // This method instantiates and returns optional GreetingsViewController, initializes controller's properties
    func showViewController(atIndex index: Int) -> GreetingsViewController? {
        guard index >= 0, index < greetingsTextArray.count else { return nil }
        guard let greetingsVC = storyboard?.instantiateViewController(withIdentifier: "greetingsViewController")
            as? GreetingsViewController else { return nil }
        greetingsVC.index = index
        greetingsVC.pagesCount = imagesArray.count
        greetingsVC.text = greetingsTextArray[index]
        greetingsVC.imageName = imagesArray[index]
        return greetingsVC
    }
    
    func showNextViewController(atIndex index: Int) {
        if let greetingsVC = showViewController(atIndex: index + 1) {
            setViewControllers([greetingsVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GreetingsViewController).index
        index -= 1
        return showViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GreetingsViewController).index
        index += 1
        return showViewController(atIndex: index)
    }
}
