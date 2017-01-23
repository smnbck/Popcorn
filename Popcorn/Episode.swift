//
//  Series.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class Episode {
    var title: String
    var duration: Double
    var description: String
    var episodeThumbnail: String
    
    init(title: String, duration: Double, description: String, episodeThumbnail: String) {
        self.title = title
        self.duration = duration
        self.description = description
        self.episodeThumbnail = episodeThumbnail
    }
}
