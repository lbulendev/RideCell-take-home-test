//
//  Vehicle.swift
//  RideCell
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import Foundation
import CoreLocation

struct Vehicle {
    var id: String
    var licensePlate: String
    var licenseState: String?
    var VIN: String
    var carClass: String?
    var color: String?
    var year: String?
    var make: String?
    var model: String?
    var chargeLevel: Float?
    var fuelLevel: Float?
    var numOfSeats: Int?
    var fuelCap: Int?
    var fleetID: String?
    var coordinate: CLLocationCoordinate2D?

    init(id: String,
         licensePlate: String,
         licenseState: String,
         VIN: String,
         carClass: String? = nil,
         color: String? = nil,
         year: String? = nil,
         make: String? = nil,
         model: String? = nil,
         chargeLevel: Float? = nil,
         fuelLevel: Float? = nil,
         numOfSeats: Int? = nil,
         fuelCap: Int? = nil,
         fleetID: String? = nil,
         coordinate: CLLocationCoordinate2D? = nil) {
        self.id = id
        self.licensePlate = licensePlate
        self.licenseState = licenseState
        self.VIN = VIN
        self.carClass = carClass
        self.year = year
        self.color = color
        self.make = make
        self.model = model
        self.chargeLevel = chargeLevel
        self.fuelLevel = fuelLevel
        self.numOfSeats = numOfSeats
        self.fuelCap = fuelCap
        self.fleetID = fleetID
        self.coordinate = coordinate
    }
}


func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
    if (lhs.id != rhs.id) {
        return false
    }
    if (lhs.licensePlate != rhs.licensePlate) {
        return false
    }
    if (lhs.licenseState != rhs.licenseState) {
        return false
    }
    if (lhs.VIN != rhs.VIN) {
        return false
    }
    if (lhs.carClass != rhs.carClass) {
        return false
    }
    if (lhs.year != rhs.year) {
        return false
    }
    if (lhs.color != rhs.color) {
        return false
    }
    if (lhs.make != rhs.make) {
        return false
    }
    if (lhs.model != rhs.model) {
        return false
    }
    if (lhs.chargeLevel != rhs.chargeLevel) {
        return false
    }
    if (lhs.fuelLevel != rhs.fuelLevel) {
        return false
    }
    if (lhs.numOfSeats != rhs.numOfSeats) {
        return false
    }
    if (lhs.fuelCap != rhs.fuelCap) {
        return false
    }
    if (lhs.fleetID != rhs.fleetID) {
        return false
    }
    if (lhs.coordinate?.latitude != rhs.coordinate?.latitude) {
        return false
    }
    if (lhs.coordinate?.longitude != rhs.coordinate?.longitude) {
        return false
    }
    return true
}
