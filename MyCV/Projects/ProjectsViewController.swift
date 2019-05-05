//
//  ProjectsViewController.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/26/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

// I've decided to make Project's screen totally from code without using storyboard

class ProjectsViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    // Model access
    let project = Project()
    
    private let projectsVCtext = """
Here are my projects.
Scroll. Tap.
"""
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Creating collection view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
        view.addSubview(textLabel)
        view.addSubview(collectionView)
        
        textLabel.text = projectsVCtext
        textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 20
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.register(ProjectCollectionViewCell.self, forCellWithReuseIdentifier: ProjectCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        collectionView.isUserInteractionEnabled = true
        collectionView.topAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 250)
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return project.projectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProjectCollectionViewCell.reuseIdentifier, for: indexPath) as! ProjectCollectionViewCell
        let projectToShow = project.projectsArray[indexPath.row]
        cell.projectImage.image = UIImage(named: projectToShow.mainImage())
        cell.projectNameLabel.text =  projectToShow.rawValue
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let projectDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "projectDetailsVC") as? ProjectDetailViewController {
            projectDetailVC.project = project.projectsArray[indexPath.row]
            navigationController?.show(projectDetailVC, sender: self)
        }
    }
}
