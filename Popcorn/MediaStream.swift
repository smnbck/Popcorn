//
//  Media.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class MediaStream {
    var id: Int
    var title: String
    var thumbnailImageString: String
    var playerImageString: String
    var description: String
    var genre: String?
    var usk: String?
    var rating: String?
    
    init(id: Int, title: String, description: String, genre: String?, usk: String?, rating: String?) {
        self.id = id
        self.title = title
        self.thumbnailImageString = "\(id)" + "Icon"
        self.playerImageString = "\(id)" + "Video"
        self.description = description
        self.genre = genre
        self.usk = usk
        self.rating = rating
    }
}
