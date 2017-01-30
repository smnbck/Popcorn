//
//  SpecificViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit
import MarqueeLabel

class BottomMenuViewController: MenuViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextShowLabel: UILabel!
    @IBOutlet weak var ratingsIcon: UIImageView!
    @IBOutlet weak var imdbLabel: UILabel!
    
    // MARK: - Stored Properties
    var mediaStream: MediaStream?
    var passedSeason: String?
    var passedEpisode: String?
    var similiarStreams: [MediaStream] = []
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
        setupLabels()
        setupRandomSimiliarStreams()
    }
    
    func setupRandomSimiliarStreams() {
        let numberOfActive = ActiveVideos.sharedInstance.activeVideos.count
        var prevNrArray: [Int] = []
        for _ in 0..<7 {
            var randomNR = arc4random_uniform(UInt32(numberOfActive))
            while prevNrArray.contains(Int(randomNR)) {
                randomNR = arc4random_uniform(UInt32(numberOfActive))
            }
            
            prevNrArray.append(Int(randomNR))
            let randomID = ActiveVideos.sharedInstance.activeVideos[Int(randomNR)]
            let mediaStreams = MediaStreamsArray().array
            self.similiarStreams.append(mediaStreams[Int(randomID)])
        }
    }
    
    func setupLabels() {
        self.thumbnail.layer.cornerRadius = 5
        var titleAddition = ""
        if let season = self.passedSeason {
            if let episode = self.passedEpisode {
                titleAddition = ", Staffel \(season), Episode \(episode)"
            }
        }
        
        if let stream = self.mediaStream {
            self.titleLabel.text = stream.title + titleAddition
            if stream.usk != nil && stream.genre != nil {
                self.infoLabel.text = "\(stream.genre!), USK \(stream.usk!)"
            } else {
                self.infoLabel.text = ""
            }
            
            if stream.rating != nil {
                self.scoreLabel.text = stream.rating!
            } else {
                self.scoreLabel.isHidden = true
                self.ratingsIcon.isHidden = true
                self.imdbLabel.isHidden = true
            }
            
            self.descriptionLabel.text = stream.description
            self.moreButton.setTitle(" mehr Episoden von\n \(self.mediaStream!.title)", for: .normal)
        }
        
        if self.mediaStream is TVStationMovieStream || self.mediaStream is TVStationSeriesStream {
            self.moreButton.setTitleColor(ColorName.magenta.color, for: .focused)
            self.moreButton.setTitleColor(ColorName.darkMagenta.color, for: .highlighted)
            
            if let stream = self.mediaStream as? TVStationSeriesStream {
                nextShowLabel.text = "Um \(stream.endingTime) Uhr folgt\n\(stream.nextShow)"
            }
            if let stream = self.mediaStream as? TVStationMovieStream {
                nextShowLabel.text = "Um \(stream.endingTime) Uhr folgt\n\(stream.nextShow)"
            }
            
            if self.mediaStream?.title != "The Big Bang Theory" {
                moreButton.isHidden = true
            }
        } else {
            nextShowLabel.isHidden = true
        }
        
        if let thumbnailImage = UIImage(named: (self.mediaStream?.thumbnailImageString)!) {
            self.thumbnail.image = thumbnailImage
        }
        
        if self.mediaStream is MovieStream {
            self.moreButton.isHidden = true
        }
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
                    if self.similiarStreams is TVStationMovieStream || self.mediaStream is TVStationSeriesStream {
                        nextFocusedView.imageView?.tintColor = ColorName.magenta.color
                        nextFocusedView.tintColor = ColorName.magenta.color
                    } else {
                        nextFocusedView.imageView?.tintColor = ColorName.orange.color
                        nextFocusedView.tintColor = ColorName.orange.color
                    }
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
            
            thumbnailCell.thumbnailPreview.image = UIImage(named: self.similiarStreams[indexPath.row].thumbnailImageString)
            thumbnailCell.thumbnailPreview.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailPreview.clipsToBounds = false
            
            thumbnailCell.thumbnailLabel.textColor = UIColor.white
            
            thumbnailCell.thumbnailLabel.text = self.similiarStreams[indexPath.row].title
            
            thumbnailCell.thumbnailLabel.speed = MarqueeLabel.SpeedLimit.rate(50)
            thumbnailCell.thumbnailLabel.trailingBuffer = 40
            thumbnailCell.thumbnailLabel.fadeLength = 20
            
            if self.similiarStreams[indexPath.row] is TVStationMovieStream || self.similiarStreams[indexPath.row] is TVStationSeriesStream {
                thumbnailCell.thumbnailBackground.image = UIImage(named: "liveThumbnail")
                thumbnailCell.thumbnailExtraLabel.isHidden = false
            } else {
                thumbnailCell.thumbnailExtraLabel.isHidden = true
            }
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
                // watch that todo
                if self.similiarStreams[nextIndexPath.row] is TVStationMovieStream || self.similiarStreams[nextIndexPath.row] is TVStationSeriesStream {
                    cell.thumbnailLabel.textColor = ColorName.magenta.color
                } else {
                    cell.thumbnailLabel.textColor = ColorName.orange.color
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let mediaID = self.similiarStreams[indexPath.row].id
            prepareForRemovingWithID(mediaID: mediaID)
    }
    
    // MARK: - Buttons
    @IBAction func moreButtonPressed(_ sender: Any) {
        
    }
}
