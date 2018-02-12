//
//  MenuViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit
import MarqueeLabel

class TopMenuViewController: MenuViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mediaLibraryButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var platformButton: UIButton!
    
    @IBOutlet weak var resumeLabel: UILabel!
    
    @IBOutlet weak var resumeCollectionView: UICollectionView!
    @IBOutlet weak var suggestionCollectionView: UICollectionView!
    
    @IBOutlet weak var watchLabel: UILabel!
    var currentlyRunning = ""
    var startedVideoIDs: [Int] = []
    
    // MARK: - Stored Properties
    let streams: [MediaStream] = []
    var tableViewLoaded = false
    let defaults = UserDefaults.standard
    
    var resumeStreams: [MediaStream] = []
    var suggestionsStreams: [MediaStream] = []
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
        if let scrollView = resumeCollectionView.superview as? UIScrollView {
            scrollView.delaysContentTouches = false
        }
        
        self.watchLabel.text = currentlyRunning
//        self.searchButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateMediaStreams()
    }
    
    func updateMediaStreams() {
        self.resumeStreams = []
        self.suggestionsStreams = []
//        var startedStreamIDs: [Int] = []
//        if let startedVideosArray = defaults.array(forKey: "startedStreamIDs") as? [Int] {
//            startedStreamIDs = startedVideosArray
//        } else {
//            defaults.set(startedStreamIDs, forKey: "startedStreamIDs")
//        }
        
        if let activeVideosArray = defaults.array(forKey: "activeVideos") as? [Int] {
            ActiveVideos.sharedInstance.activeVideos = activeVideosArray
        }
        
        if let activeStationsArray = defaults.array(forKey: "activeStations") as? [Int] {
            ActiveStations.sharedInstance.activeStations = activeStationsArray
        }
        
        let allStreams = MediaStreamsArray().array
        for i in 0..<allStreams.count {
            for j in 0..<ActiveVideos.sharedInstance.activeVideos.count {
                if ActiveVideos.sharedInstance.activeVideos[j] == allStreams[i].id {
                    self.suggestionsStreams.append(allStreams[i])
                    for h in 0..<startedVideoIDs.count {
                        if allStreams[i].id == startedVideoIDs[h] {
                            self.resumeStreams.append(allStreams[i])
                        }
                    }
                    break
                }
            }
            for j in 0..<ActiveStations.sharedInstance.activeStations.count {
                if ActiveStations.sharedInstance.activeStations[j] == allStreams[i].id {
                    self.suggestionsStreams.append(allStreams[i])
                    for h in 0..<startedVideoIDs.count {
                        if allStreams[i].id == startedVideoIDs[h] {
                            self.resumeStreams.append(allStreams[i])
                        }
                    }
                    break
                }
            }
            
//            self.resumeStreams.shuffle()
        }
        
        if resumeStreams.count > 0 {
            self.resumeLabel.alpha = 0
        }
        
        self.suggestionsStreams.shuffle()
        
        resumeCollectionView.reloadData()
        suggestionCollectionView.reloadData()
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
    
    override func prepareForRemovingWithID(mediaID: Int) {
        super.prepareForRemovingWithID(mediaID: mediaID)
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
            return resumeStreams.count
        } else if collectionView == self.suggestionCollectionView {
            return suggestionsStreams.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath)
        if let thumbnailCell = cell as? TopMenuCollectionViewCell {
            
            
            if collectionView == self.resumeCollectionView {
                if resumeStreams[indexPath.row] is TVStationSeriesStream || resumeStreams[indexPath.row] is TVStationMovieStream {
                    if let stream = resumeStreams[indexPath.row] as? TVStationMovieStream {
                        let streamTitle = resumeStreams[indexPath.row].title
                        thumbnailCell.thumbnailLabel.text = streamTitle //+ "(\(stream.tvStationName))"
                    }
                    if let stream = resumeStreams[indexPath.row] as? TVStationSeriesStream {
                        let streamTitle = resumeStreams[indexPath.row].title
                        thumbnailCell.thumbnailLabel.text = streamTitle //+ "(\(stream.tvStationName))"
                    }
                    thumbnailCell.thumbnailBackground.image = UIImage(named: "liveThumbnail")
                    thumbnailCell.thumbnailExtraLabel.isHidden = false
                } else {
                    thumbnailCell.thumbnailBackground.image = UIImage(named: "videoThumbnail")
                    let streamTitle = resumeStreams[indexPath.row].title
                    thumbnailCell.thumbnailLabel.text = streamTitle
                    thumbnailCell.thumbnailExtraLabel.isHidden = true
                }
                
                if let streamImage = UIImage(named: resumeStreams[indexPath.row].thumbnailImageString) {
                    thumbnailCell.thumbnailPreview.image = streamImage
                }
            } else if collectionView == self.suggestionCollectionView {
                if suggestionsStreams[indexPath.row] is TVStationSeriesStream || suggestionsStreams[indexPath.row] is TVStationMovieStream {
                    if let stream = suggestionsStreams[indexPath.row] as? TVStationMovieStream {
                        let streamTitle = stream.title //+ " (\(stream.tvStationName))"
                        thumbnailCell.thumbnailLabel.text = streamTitle
                    }
                    if let stream = suggestionsStreams[indexPath.row] as? TVStationSeriesStream {
                        let streamTitle = stream.title //+ " (\(stream.tvStationName))"
                        thumbnailCell.thumbnailLabel.text = streamTitle
                    }
                    thumbnailCell.thumbnailBackground.image = UIImage(named: "liveThumbnail")
                    thumbnailCell.thumbnailExtraLabel.isHidden = false
                } else {
                    thumbnailCell.thumbnailBackground.image = UIImage(named: "videoThumbnail")
                    let streamTitle = suggestionsStreams[indexPath.row].title
                    thumbnailCell.thumbnailLabel.text = streamTitle
                    thumbnailCell.thumbnailExtraLabel.isHidden = true
                }
                
                if let streamImage = UIImage(named: suggestionsStreams[indexPath.row].thumbnailImageString) {
                    thumbnailCell.thumbnailPreview.image = streamImage
                }
            }
            thumbnailCell.thumbnailBackground.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailBackground.clipsToBounds = false
            
            thumbnailCell.thumbnailPreview.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailPreview.clipsToBounds = false
            
            thumbnailCell.thumbnailExtraLabel.adjustsImageWhenAncestorFocused = true
            thumbnailCell.thumbnailExtraLabel.clipsToBounds = false
            
            thumbnailCell.thumbnailLabel.textColor = UIColor.white
            
            thumbnailCell.thumbnailLabel.speed = MarqueeLabel.SpeedLimit.rate(50)
            thumbnailCell.thumbnailLabel.trailingBuffer = 40
            thumbnailCell.thumbnailLabel.fadeLength = 20
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if collectionView == self.resumeCollectionView {
            if let prevIndexPath = context.previouslyFocusedIndexPath {
                if let cell = collectionView.cellForItem(at: prevIndexPath) as? TopMenuCollectionViewCell {
                    cell.thumbnailLabel.textColor = UIColor.white
                }
            }
                
            if let nextIndexPath = context.nextFocusedIndexPath {
                if let cell = collectionView.cellForItem(at: nextIndexPath) as? TopMenuCollectionViewCell {
                    // TODO: Change color based on live oder video stream
                    if resumeStreams[nextIndexPath.row] is TVStationSeriesStream || resumeStreams[nextIndexPath.row] is TVStationMovieStream {
                        cell.thumbnailLabel.textColor = ColorName.magenta.color
                    } else {
                        cell.thumbnailLabel.textColor = ColorName.orange.color
                    }
                }
            }
        } else if collectionView == self.suggestionCollectionView {
            if let prevIndexPath = context.previouslyFocusedIndexPath {
                if let cell = collectionView.cellForItem(at: prevIndexPath) as? TopMenuCollectionViewCell {
                    cell.thumbnailLabel.textColor = UIColor.white
                }
            }
            
            if let nextIndexPath = context.nextFocusedIndexPath {
                if let cell = collectionView.cellForItem(at: nextIndexPath) as? TopMenuCollectionViewCell {
                    // TODO: Change color based on live oder video stream
                    if suggestionsStreams[nextIndexPath.row] is TVStationSeriesStream || suggestionsStreams[nextIndexPath.row] is TVStationMovieStream {
                        cell.thumbnailLabel.textColor = ColorName.magenta.color
                    } else {
                        cell.thumbnailLabel.textColor = ColorName.orange.color
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.resumeCollectionView {
//            if resumeStreams[indexPath.row] is TVStationSeriesStream || resumeStreams[indexPath.row] is TVStationMovieStream {
                let mediaID = self.resumeStreams[indexPath.row].id
                prepareForRemovingWithID(mediaID: mediaID)
//            } else {
//                if let vc = StoryboardScene.Preview.previewScene.viewController() as? PreviewViewController {
//                    self.present(vc, animated: true, completion: nil)
//                    
//                }
//            }
            
        } else if collectionView == self.suggestionCollectionView {
//            if suggestionsStreams[indexPath.row] is TVStationSeriesStream || suggestionsStreams[indexPath.row] is TVStationMovieStream {
                let mediaID = self.suggestionsStreams[indexPath.row].id
                prepareForRemovingWithID(mediaID: mediaID)
//            } else {
//                if let vc = StoryboardScene.Preview.previewScene.viewController() as? PreviewViewController {
//                    self.present(vc, animated: true, completion: nil)
//                    
//                }
//            }
        }
    }
    
    // MARK: -Buttons
    @IBAction func mediaLibraryButtonPressed(_ sender: Any) {
        let numberOfVideos = self.suggestionsStreams.count
        let randomNumber = arc4random_uniform(UInt32(numberOfVideos))
        let mediaID = self.suggestionsStreams[Int(randomNumber)].id
        prepareForRemovingWithID(mediaID: mediaID)
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
    }
    
    @IBAction func platformButtonPressed(_ sender: Any) {
        let viewController = StoryboardScene.Platforms.platforms.instantiate()
        self.present(viewController, animated: true, completion: nil)
    }
}



extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

