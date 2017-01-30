//
//  TVStationMovieStream.swift
//  Popcorn
//
//  Created by Simon Back on 24.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

import Foundation

class TVStationMovieStream: MovieStream {
    var stationId: Int
    var tvStationName: String
    var tvStationIcon: String
    var tvStationThumbnail: String
    var tvStationVideo: String
    var startingTime: String
    var endingTime: String
    var nextShow: String
    var isExistingShow: Bool
    
    init(id: Int, title: String, description: String, duration: Double, genre: String?, usk: String?, rating: String?, stationId: Int, tvStationName: String, startingTime: String, endingTime: String, nextShow: String, isExistingShow: Bool) {
        
        self.stationId = stationId
        self.tvStationName = tvStationName
        self.tvStationIcon = tvStationName + "Icon"
        self.tvStationThumbnail = tvStationName + "Poster"
        self.tvStationVideo = tvStationName + "Video"
        self.startingTime = startingTime
        self.endingTime = endingTime
        self.nextShow = nextShow
        self.isExistingShow = isExistingShow
        
        super.init(id: id, title: title, description: description, duration: duration, genre: genre, usk: usk, rating: rating)
    }
}
