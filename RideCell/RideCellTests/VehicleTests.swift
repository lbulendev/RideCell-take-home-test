//
//  VehicleTests.swift
//  RideCellTests
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import XCTest
@testable import RideCell
import CoreLocation

class VehicleTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Init_WhenGivenFullCar_SetsCar() {
        // Full vehicle = fully populate attributes for vehicle
        let fullVehicle = Vehicle(id: "A000001", licensePlate: "ABC123", licenseState: "CA", VIN: "AGR94132", carClass: "M", color: "Red", year: "2010", make: "Toyota", model: "Corolla", chargeLevel: 0.0, fuelLevel: 0.75, numOfSeats: 5, fuelCap: 13, fleetID: "UHAUL001", coordinate: CLLocationCoordinate2D.init(latitude: 37.7749, longitude: -122.4194))
        
        XCTAssertEqual(fullVehicle.id, "A000001",
                       "car should be set id")
        XCTAssertEqual(fullVehicle.color, "Red",
                       "car should be set color")
    }
    
    func test_Init_WhenGivenPartialCar_SetsCar() {
        // Partial car = partially populate attributes for car; leave some attributes as Nil
        let partialVehicle1 = Vehicle(id: "A000002", licensePlate: "123ABC", licenseState: "CA", VIN: "94132AGR")
        let partialVehicle2 = Vehicle(id: "A000003", licensePlate: "567DEF", licenseState: "CA", VIN: "9999RACECAR", color: "Gold", year: "2015", make: "Toyota", model: "RAV4")
        
        XCTAssertEqual(partialVehicle1.id, "A000002",
                       "car should be set id")
        XCTAssertEqual(partialVehicle2.id, "A000003",
                       "car should be set id")
        XCTAssertEqual(partialVehicle2.color, "Gold",
                       "car should be set color")
        XCTAssertEqual(partialVehicle2.model, "RAV4",
                       "car should be set model")
    }
    
}
