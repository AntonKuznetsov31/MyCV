//
//  ProjectCollectionViewCell.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/26/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

// Creating collection view cell from code

class ProjectCollectionViewCell: UICollectionViewCell   {
    
    // Model access
    let project = Project()
    
    static let reuseIdentifier = "projectCell"
    
    let projectImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleToFill
        return imageView
    }()
    
    let projectNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Main initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(projectImage)
        addSubview(projectNameLabel)
        
        projectImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        projectImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        projectImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        projectImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        projectNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        projectNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        projectNameLabel.topAnchor.constraint(equalTo: projectImage.bottomAnchor, constant: 12).isActive = true
        
    }
    
    // Making some visual chenges
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 6)
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
