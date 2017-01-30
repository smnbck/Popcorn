//
//  LiveSeriesStream.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class LiveSeriesStream: SeriesStream {
    
    var startingTime: String
    var endingTime: String
    var nextShowTitle: String
    
    init(id: Int, title: String, description: String, startingTime: String, endingTime: String, nextShowTitle: String, duration: Double, seasons: [Season], genre: String?, usk: String?, rating: String?) {
        self.startingTime = startingTime
        self.endingTime = endingTime
        self.nextShowTitle = nextShowTitle
        
        super.init(id: id, title: title, description: description, seasons: seasons, genre: genre, usk: usk, rating: rating)
    }
}
