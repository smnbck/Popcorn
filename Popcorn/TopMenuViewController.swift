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
    @IBOutlet weak var mediaLibraryButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var platformButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Stored Properties
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
    }
    
    func setupButton() {
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
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView is UIButton {
            if let nextFocusedView = context.nextFocusedView as? UIButton {
                UIView.animate(withDuration: 0.2, animations: {
                    nextFocusedView.titleLabel?.font = nextFocusedView.titleLabel?.font.withSize(54)
                    nextFocusedView.imageView?.tintColor = UIColor.white
                })
            }
        }
        if context.previouslyFocusedView is UIButton {
            if let prevFocusedView = context.previouslyFocusedView as? UIButton {
                UIView.animate(withDuration: 0.2, animations: {
                    prevFocusedView.titleLabel?.font = prevFocusedView.titleLabel?.font.withSize(44)
                    prevFocusedView.imageView?.tintColor = UIColor.white
                })
            }
        }
    }
    
    func removeFocusOnViews() {
        self.backButton.titleLabel?.font = self.backButton.titleLabel?.font.withSize(44)
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
            thumbnailCell.thumbnailBackground.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailBackground.clipsToBounds = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

