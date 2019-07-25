//
//  Annotation.swift
//  RideCell
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import Foundation
import CoreLocation

struct Annotation: Equatable {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D,
         title: String? = nil,
         subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
}

func ==(lhs: Annotation, rhs: Annotation) -> Bool {
    if (lhs.coordinate.latitude != rhs.coordinate.latitude) {
        return false
    }
    if (lhs.coordinate.longitude != rhs.coordinate.longitude) {
        return false
    }
    if (lhs.title != rhs.title) {
        return false
    }
    if (lhs.subtitle != rhs.subtitle) {
        return false
    }
    return true
}
