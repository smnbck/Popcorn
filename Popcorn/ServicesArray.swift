//
//  ServicesArray.swift
//  Popcorn
//
//  Created by Simon Back on 21.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class ServicesArray {
    let services: [Service] = [
        VideoService(name: "Amazon Instant Video", logoName: "amazoninstantvideo", needsSignup: true, numberOfMovies: 145, numberOfSeries: 98),
        VideoService(name: "Maxdome", logoName: "maxdomebig", needsSignup: true, numberOfMovies: 138, numberOfSeries: 80),
        VideoService(name: "Netflix", logoName: "netflix", needsSignup: true, numberOfMovies: 167, numberOfSeries: 87),
        TVService(name: "ARD", logoName: "ardbig", needsSignup: false, numberOfStations: 26, numberOfVideos: 2034),
        TVService(name: "ZDF", logoName: "zdf", needsSignup: false, numberOfStations: 6, numberOfVideos: 1435),
        TVService(name: "7TV", logoName: "7tv", needsSignup: true, numberOfStations: 6, numberOfVideos: 1329),
        TVService(name: "TV Now", logoName: "tvnow", needsSignup: true, numberOfStations: 7, numberOfVideos: 1145)
    ]
}
