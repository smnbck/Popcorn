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
    
    @IBOutlet weak var resumeCollectionView: UICollectionView!
    @IBOutlet weak var suggestionCollectionView: UICollectionView!
    
    @IBOutlet weak var watchLabel: UILabel!
    
    // MARK: - Stored Properties
    let streams: [MediaStream] = []
    var tableViewLoaded = false
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
        if let scrollView = resumeCollectionView.superview as? UIScrollView {
            scrollView.delaysContentTouches = false
        }
        
        let currentlyRunning = "Avengers: Age of Ultron"
        self.watchLabel.text = "Gerade läuft \(currentlyRunning)"
    }
    func animateMenu() {
        self.watchLabel.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.watchLabel.alpha = 0.6
        }
    }
    
    override func prepareForRemoving() {
        super.prepareForRemoving()
        UIView.animate(withDuration: 0.5) { 
            self.watchLabel.alpha = 0
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
    
    // MARK: - Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.resumeCollectionView {
            return 4
        } else if collectionView == self.suggestionCollectionView {
            return 10
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath)
        if let thumbnailCell = cell as? TopMenuCollectionViewCell {
            if collectionView == self.resumeCollectionView {
                thumbnailCell.thumbnailBackground.image = UIImage(named: "videoThumbnail")
            } else if collectionView == self.suggestionCollectionView {
                thumbnailCell.thumbnailBackground.image = UIImage(named: "liveThumbnail")
            }
            
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.resumeCollectionView {
            if let vc = StoryboardScene.Preview.previewScene.viewController() as? PreviewViewController {
                self.present(vc, animated: true, completion: nil)
            }
        } else if collectionView == self.suggestionCollectionView {
            if let vc = StoryboardScene.Preview.previewScene.viewController() as? PreviewViewController {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: -Buttons
    @IBAction func mediaLibraryButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
    }
    
    @IBAction func platformButtonPressed(_ sender: Any) {
        let viewController = StoryboardScene.Platforms.platformsScene.viewController()
        self.present(viewController, animated: true, completion: nil)
    }
    
}

