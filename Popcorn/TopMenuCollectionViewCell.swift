//
//  TopMenuCollectionViewCell.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit
import MarqueeLabel

class TopMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailBackground: UIImageView!
    @IBOutlet weak var thumbnailPreview: UIImageView!

    @IBOutlet weak var thumbnailExtraLabel: UIImageView!
    @IBOutlet weak var thumbnailLabel: MarqueeLabel!
    
}
