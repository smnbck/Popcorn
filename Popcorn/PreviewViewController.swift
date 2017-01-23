//
//  PreviewViewController.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewImage.layer.cornerRadius = 4
    }
    
    // MARK: Table View Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // episodes
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.numberOfSections > 1 {
            return "Staffel 1"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        if let cell = cell as? PreviewTableViewCell {
            let title = "Die Intrige"
            cell.episodeTitle.text = "\(indexPath.row + 1). \(title)"
            cell.episodeDescription.text = "Hier steht was alles in dieser spannenden Folge passiert."
            cell.episodeThumbnail.image = UIImage(named: "houseofcardsposter")
            cell.episodeThumbnail.layer.cornerRadius = 4
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let prevIndexPath = context.previouslyFocusedIndexPath {
            let prevCell = tableView.cellForRow(at: prevIndexPath)
            if let prevCell = prevCell as? PreviewTableViewCell {
                prevCell.episodeTitle.textColor = UIColor.white
                prevCell.episodeDescription.textColor = UIColor.white
                tableView.deselectRow(at: prevIndexPath, animated: false)
            }
        }
        
        if let nextIndexPath = context.nextFocusedIndexPath {
            let nextCell = tableView.cellForRow(at: nextIndexPath)
            if let nextCell = nextCell as? PreviewTableViewCell {
                nextCell.episodeTitle.textColor = ColorName.orange.color
                nextCell.episodeDescription.textColor = ColorName.orange.color
                tableView.selectRow(at: nextIndexPath, animated: false, scrollPosition: .none)
            }
        }
    }
}
