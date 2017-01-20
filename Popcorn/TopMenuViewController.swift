//
//  MenuViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class TopMenuViewController: MenuViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Stored Properties
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
    }
    
    func animateMenu() {
        self.backButton.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.backButton.alpha = 1
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        print("backbutton pressed")
        prepareForRemoving()
    }
    
    override func prepareForRemoving() {
        super.prepareForRemoving()
        UIView.animate(withDuration: 0.5) { 
            self.backButton.alpha = 0
        }
    }
    
    // MARK: - First Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath)
        if let thumbnailCell = cell as? TopMenuCollectionViewCell {
            thumbnailCell.thumbnailBackground.image = UIImage(named: "liveThumbnail")
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

