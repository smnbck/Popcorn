//
//  LiveStream.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class LiveMovieStream: MovieStream {
    
    var startingTime: String
    var endingTime: String
    var nextShowTitle: String
    
    init(id: Int, title: String, description: String, startingTime: String, endingTime: String, nextShowTitle: String, duration: Double, genre: String?, usk: String?, rating: String?) {
        self.startingTime = startingTime
        self.endingTime = endingTime
        self.nextShowTitle = nextShowTitle
        
        super.init(id: id, title: title, description: description, duration: duration, genre: genre, usk: usk, rating: rating)
    }
}
