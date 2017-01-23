//
//  SeriesStream.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class SeriesStream: MediaStream {
    
    var seasons: [Season]
    
    init(title: String, thumbnailImageString: String, playerImageString: String, description: String, duration: Double, seasons: [Season], genre: String?, usk: String?, rating: String?) {
        super.init(title: title, thumbnailImageString: thumbnailImageString, playerImageString: playerImageString, description: description, genre: genre, usk: usk, rating: rating)
        
        self.seasons = seasons
    }
}
