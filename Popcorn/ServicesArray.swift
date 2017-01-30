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
        VideoService(name: "Amazon Instant Video", logoName: "amazoninstantvideo", needsSignup: true, movieIDs: [1,2,4,5,11], seriesIDs: [13,16,17,19,20]),
        VideoService(name: "Maxdome", logoName: "maxdomebig", needsSignup: true, movieIDs: [1,2,6,7,9,11], seriesIDs: [13,16,17,19,20,21]),
        VideoService(name: "Netflix", logoName: "netflix", needsSignup: true, movieIDs: [1,3,8,9,10,11], seriesIDs: [12,13,14,15,16,18,19]),
        TVService(name: "ARD", logoName: "ardbig", needsSignup: false, stationIDs: [22], numberOfVideos: 234),
        TVService(name: "ZDF", logoName: "zdf", needsSignup: false, stationIDs: [], numberOfVideos: 143),
        TVService(name: "7TV", logoName: "7tv", needsSignup: true, stationIDs: [23,25,26], numberOfVideos: 132),
        TVService(name: "TV Now", logoName: "tvnow", needsSignup: true, stationIDs: [24], numberOfVideos: 114)
    ]
}
