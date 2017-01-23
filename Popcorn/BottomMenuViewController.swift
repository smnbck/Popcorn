//
//  SpecificViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class BottomMenuViewController: MenuViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var progressBar: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Stored Properties
    
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
    }
    
    func setupLabels() {
        self.thumbnail.layer.cornerRadius = 5
        self.titleLabel.text = "House of Cards, Staffel 1, Episode 12"
        self.infoLabel.text = "Drama, USK 12"
        self.scoreLabel.text = "9,0"
    }
    
    func animateMenu() {
        UIView.animate(withDuration: 0.2) {
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView is UIButton {
            if let nextFocusedView = context.nextFocusedView as? UIButton {
                UIView.animate(withDuration: 0.2, animations: {
                    nextFocusedView.titleLabel?.font = nextFocusedView.titleLabel?.font.withSize(44)
                    nextFocusedView.imageView?.tintColor = ColorName.orange.color
                    nextFocusedView.tintColor = ColorName.orange.color
                })
            }
        }
        if context.previouslyFocusedView is UIButton {
            if let prevFocusedView = context.previouslyFocusedView as? UIButton {
                UIView.animate(withDuration: 0.2, animations: {
                    prevFocusedView.titleLabel?.font = prevFocusedView.titleLabel?.font.withSize(36)
                    prevFocusedView.imageView?.tintColor = UIColor.white
                    prevFocusedView.tintColor = UIColor.white
                })
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 4
        } else if collectionView == self.collectionView {
            return 10
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath)
        if let thumbnailCell = cell as? TopMenuCollectionViewCell {
            thumbnailCell.thumbnailBackground.image = UIImage(named: "videoThumbnail")
            
            thumbnailCell.thumbnailBackground.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailBackground.clipsToBounds = false
            
            thumbnailCell.thumbnailPreview.image = UIImage(named: "houseofcardsposter")
            thumbnailCell.thumbnailPreview.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailPreview.clipsToBounds = false
            
            thumbnailCell.thumbnailLabel.textColor = UIColor.white
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let prevIndexPath = context.previouslyFocusedIndexPath {
            if let cell = collectionView.cellForItem(at: prevIndexPath) as? TopMenuCollectionViewCell {
                cell.thumbnailLabel.textColor = UIColor.white
            }
        }
        
        if let nextIndexPath = context.nextFocusedIndexPath {
            if let cell = collectionView.cellForItem(at: nextIndexPath) as? TopMenuCollectionViewCell {
                // TODO: Change color based on live oder video stream
                cell.thumbnailLabel.textColor = ColorName.orange.color
            }
        }
    }
    
    // MARK: - Buttons
    @IBAction func moreButtonPressed(_ sender: Any) {
        
    }
}
