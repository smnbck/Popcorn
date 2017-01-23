//
//  VideoService.swift
//  Popcorn
//
//  Created by Simon Back on 21.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class VideoService: Service {
    var numberOfMovies: Int
    var numberOfSeries: Int
    
    init(name: String, logoName: String, needsSignup: Bool, numberOfMovies: Int, numberOfSeries: Int) {
        self.numberOfSeries = numberOfSeries
        self.numberOfMovies = numberOfMovies
        super.init(name: name, logoName: logoName, needsSignup: needsSignup)
    }
}
