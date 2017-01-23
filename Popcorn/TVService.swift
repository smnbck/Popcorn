//
//  TVService.swift
//  Popcorn
//
//  Created by Simon Back on 21.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class TVService: Service {
    var numberOfStations: Int
    var numberOfVideos: Int
    
    init(name: String, logoName: String, needsSignup: Bool, numberOfStations: Int, numberOfVideos: Int) {
        self.numberOfStations = numberOfStations
        self.numberOfVideos = numberOfVideos
        super.init(name: name, logoName: logoName, needsSignup: needsSignup)
    }
}
