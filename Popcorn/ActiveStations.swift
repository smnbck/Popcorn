//
//  ActiveStations.swift
//  Popcorn
//
//  Created by Simon Back on 24.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class ActiveStations {
    static let sharedInstance = ActiveStations()
    var activeStations: [Int] = []
}
