//
//  FleetTests.swift
//  RideCellTests
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import XCTest
@testable import RideCell

class FleetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init_WhenGivenFullFleet_SetsFleet() {
        // Full fleet = fully populate attributes for fleet
        let fullFleet = Fleet(id: "UHAUL001", name: "UHaul Fleet", logo: "base64")
        
        XCTAssertEqual(fullFleet.id, "UHAUL001",
                       "fleet should be set id")
        XCTAssertEqual(fullFleet.name, "UHaul Fleet",
                       "fleet should be set name")
        XCTAssertEqual(fullFleet.logo, "base64",
                       "fleet should be set logo")
    }

    func test_Init_WhenGivenPartiallFleet_SetsFleet() {
        // Partial fleet = partially populate attributes for fleet; leave some attributes as Nil
        let partialFleet1 = Fleet(id: "UHAUL002", name: "UHaul Fleet2")

        
        XCTAssertEqual(partialFleet1.id, "UHAUL002",
                       "fleet should be set id")
        XCTAssertEqual(partialFleet1.name, "UHaul Fleet2",
                       "fleet should be set name")
    }

}
