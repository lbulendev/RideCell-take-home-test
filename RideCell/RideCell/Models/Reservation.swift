//
//  Reservation.swift
//  RideCell
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import Foundation

struct Reservation {
    var id: String
    var date: Date
    var startDate: Date
    var endDate: Date?
    var carId: String?
    var driverId: String?
    
    init(id: String,
         date: Date,
         startDate: Date,
         endDate: Date? = nil,
         carId: String? = nil,
         driverId: String? = nil) {
        self.id = id
        self.date = date
        self.startDate = startDate
        self.endDate = endDate
        self.carId = carId
        self.driverId = driverId
    }
}
