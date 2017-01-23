//
//  MovieStream.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class MovieStream: MediaStream {
    
    var duration: Double
    
    init(title: String, thumbnailImageString: String, playerImageString: String, description: String, duration: Double) {
        super.init(title: title, thumbnailImageString: thumbnailImageString, playerImageString: playerImageString, description: description, genre: genre, usk: usk, rating: rating)
        
        self.duration = duration
    }
}
