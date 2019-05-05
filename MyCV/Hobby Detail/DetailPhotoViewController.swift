//
//  DetailPhotoViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/23/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // Hobby type
    var hobby = Hobby.MyHobby(rawValue: "")
    
    // Index to swipe photos
    var photoIndex = Int()
    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailPhoto.isUserInteractionEnabled = true
        
        if let hobby = hobby {
            let hobbyPhotos = hobby.values()
            detailPhoto.image = UIImage(named: hobbyPhotos[photoIndex])
        }
    }
    
    // We know hobby type and photo index
    // For swiping this method use Gesture Recognizer and UIView transition method
    @IBAction func swipeImage(_ sender: UISwipeGestureRecognizer) {
        
        if sender.state == .ended {
            
            guard let hobbiesArray = hobby?.values() else { return }
            
            switch sender.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if photoIndex >= 0 && photoIndex < hobbiesArray.count - 1 {
                    photoIndex += 1
                    UIView.transition(with: detailPhoto, duration: 0.3, options: [.transitionFlipFromRight], animations: { self.detailPhoto.image = UIImage(named: hobbiesArray[self.photoIndex])})
                }
            case UISwipeGestureRecognizer.Direction.right:
                if photoIndex > 0 && photoIndex < hobbiesArray.count {
                    photoIndex -= 1
                    UIView.transition(with: detailPhoto, duration: 0.3, options: [.transitionFlipFromLeft], animations: { self.detailPhoto.image = UIImage(named: hobbiesArray[self.photoIndex])})
                }
            default:
                return
            }
        }
    }
}
