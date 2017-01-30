//
//  Series.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class Episode {
    var episodeId: Int
    var title: String
    var duration: Double
    var description: String
    
    init(episodeId: Int, title: String, duration: Double, description: String) {
        self.episodeId = episodeId
        self.title = title
        self.duration = duration
        self.description = description
    }
}
