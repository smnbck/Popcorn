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
    
    init(id: Int, title: String, description: String, seasons: [Season], genre: String?, usk: String?, rating: String?) {
        self.seasons = seasons
        
        super.init(id: id, title: title, description: description, genre: genre, usk: usk, rating: rating)
    }
}
