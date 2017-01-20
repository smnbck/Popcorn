//
//  VideoStream.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class VideoStream: MediaStream {
    override init(name: String, thumbnailImageString: String, playerImageString: String, description: String) {
        super.init(name: name, thumbnailImageString: thumbnailImageString, playerImageString: playerImageString, description: description)
    }
}
