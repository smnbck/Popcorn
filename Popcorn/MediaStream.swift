//
//  Media.swift
//  Popcorn
//
//  Created by Simon Back on 20.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class MediaStream {
    var name: String
    var thumbnailImageString: String
    var playerImageString: String
    var description: String
    
    init(name: String, thumbnailImageString: String, playerImageString: String, description: String) {
        self.name = name
        self.thumbnailImageString = thumbnailImageString
        self.playerImageString = playerImageString
        self.description = description
    }
}
