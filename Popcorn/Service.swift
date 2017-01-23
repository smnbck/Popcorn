//
//  Service.swift
//  Popcorn
//
//  Created by Simon Back on 21.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class Service {
    var name: String
    var logoName: String
    var needsSignup: Bool
    var activated: Bool = false
    
    init(name: String, logoName: String, needsSignup: Bool) {
        self.name = name
        self.logoName = logoName
        self.needsSignup = needsSignup
    }
}
