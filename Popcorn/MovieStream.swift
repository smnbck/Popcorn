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
    
    init(id: Int, title: String, description: String, duration: Double, genre: String?, usk: String?, rating: String?) {
        self.duration = duration
        super.init(id: id, title: title, description: description, genre: genre, usk: usk, rating: rating)
        
    }
}
