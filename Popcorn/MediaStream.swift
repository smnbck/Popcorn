//
//  Media.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class MediaStream {
    var title: String
    var thumbnailImageString: String
    var playerImageString: String
    var description: String
    var genre: String?
    var usk: String?
    var rating: String?
    
    init(title: String, thumbnailImageString: String, playerImageString: String, description: String, genre: String?, usk: String?, rating: String?) {
        self.title = title
        self.thumbnailImageString = thumbnailImageString
        self.playerImageString = playerImageString
        self.description = description
    }
}
