//
//  VideoService.swift
//  Popcorn
//
//  Created by Simon Back on 21.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class VideoService: Service {
    var movieIDs: [Int]
    var seriesIDs: [Int]
    
    init(name: String, logoName: String, needsSignup: Bool, movieIDs: [Int], seriesIDs: [Int]) {
        self.movieIDs = movieIDs
        self.seriesIDs = seriesIDs
        super.init(name: name, logoName: logoName, needsSignup: needsSignup)
    }
}
