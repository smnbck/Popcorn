//
//  LiveStream.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class LiveStream: MediaStream {
    
    var startingTime: String
    var endingTime: String
    
    init(title: String, thumbnailImageString: String, playerImageString: String, description: String, startingTime: String, endingTime: String) {
        super.init(title: title, thumbnailImageString: thumbnailImageString, playerImageString: playerImageString, description: description, genre: genre, usk: usk, rating: rating)
        
        self.startingTime = startingTime
        self.endingTime = endingTime
    }
}
