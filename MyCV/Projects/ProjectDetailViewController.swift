//
//  ProjectDetailViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/28/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit



class ProjectDetailViewController: UIViewController {
    
    var project = Project.MyProject(rawValue: "")
    var projectIndex = 0
    var imagesAndDescriptions = [[String : String]]()
    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var imageDesctiptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectImage.isUserInteractionEnabled = true
        projectImage.layer.cornerRadius = 10
        imageDesctiptionLabel.numberOfLines = 0
        imageDesctiptionLabel.sizeToFit()
        
        guard let imagesAndDescriptions = project?.imagesAndDescriptions() else { return }
        pageControl.numberOfPages = imagesAndDescriptions.count
        presentProjectByIndex(index: projectIndex)
        
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    // For swiping this method use Gesture Recognizer
    @IBAction func swipeImage(_ sender: UISwipeGestureRecognizer) {
        guard let projectDictionary = project?.imagesAndDescriptions() else { return }
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.left:
            if projectIndex >= 0 && projectIndex < projectDictionary.count - 1 {
                projectIndex += 1
                pageControl.currentPage += 1
                presentProjectByIndex(index:projectIndex)
            }
            
        case UISwipeGestureRecognizer.Direction.right:
            if projectIndex > 0 && projectIndex < projectDictionary.count {
                projectIndex -= 1
                pageControl.currentPage -= 1
                presentProjectByIndex(index:projectIndex)
            }
        default:
            return
        }
    }
    
    // Take image URL and description from model
    func presentProjectByIndex(index: Int) {
        if index >= 0 {
            guard let dictionary = project?.imagesAndDescriptions()[index] else { return }
            guard let value = dictionary.values.first, let key = dictionary.keys.first else { return }
            imageDesctiptionLabel.text = value
            guard let url = URL(string: key) else { return }
            downloadImageFromURL(url: url)
        }
    }
    
    // This method creates URLSesion and download image by URL from imgbb.com server
    func downloadImageFromURL(url: URL) {
        self.projectImage.isHidden = true
        let session = URLSession(configuration: .default)
        self.activityIndicator.startAnimating()
        
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error downloading cat picture: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("\(response.statusCode)")
                    if let imageData = data {
                        DispatchQueue.main.async {
                            self.projectImage.image = UIImage(data: imageData)
                            self.projectImage.isHidden = false
                            self.activityIndicator.stopAnimating()
                        }
                    } else {
                        print("Couldn't find image")
                    }
                } else {
                    
                    print("Couldn't get response")
                }
            }
        }
        downloadPicTask.resume()
    }
}
