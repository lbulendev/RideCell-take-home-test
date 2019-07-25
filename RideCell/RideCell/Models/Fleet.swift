//
//  Fleet.swift
//  RideCell
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import Foundation

struct Fleet:Equatable {
    var id: String
    var name: String
    var logo: String?
    
    init(id: String,
         name: String,
         logo: String? = nil) {
        self.id = id
        self.name = name
        self.logo = logo
    }
}

func ==(lhs: Fleet, rhs: Fleet) -> Bool {
    if (lhs.id != rhs.id) {
        return false
    }
    if (lhs.name != rhs.name) {
        return false
    }
    if (lhs.logo != rhs.logo) {
        return false
    }
    return true
}
