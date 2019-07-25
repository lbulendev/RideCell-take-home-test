//
//  AnnotationTests.swift
//  RideCellTests
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import XCTest
@testable import RideCell
import CoreLocation

class AnnotationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init_WhenGivenFullAnnotation_SetsAnnotation() {
        let point1: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 37.7749, longitude: -122.4194)
        let point2: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: -37.7749, longitude: 122.4194)

        // Full annotation = fully populate attributes for annotation
        let fullAnnotation1 = Annotation(coordinate: point1, title: "Foo", subtitle: "SubFoo")
        let fullAnnotation2 = Annotation(coordinate: point1, title: "Foo", subtitle: "SubFoo")
        let diffAnnotation1 = Annotation(coordinate: point1, title: "Foo2", subtitle: "SubFoo")
        let diffAnnotation2 = Annotation(coordinate: point1, title: "Foo", subtitle: "SubFoo2")
        let diffAnnotation3 = Annotation(coordinate: point2, title: "Foo", subtitle: "SubFoo")

        XCTAssertEqual(fullAnnotation1, fullAnnotation2, " identical annotations")
        XCTAssertNotEqual(fullAnnotation1, diffAnnotation1, " both annotations should have unique 'title'")
        XCTAssertNotEqual(diffAnnotation1, diffAnnotation2, " both annotations should have unique 'subtitle'")
        XCTAssertNotEqual(fullAnnotation1, diffAnnotation3, " both annotations should have unique 'point'")
    }

    func test_Init_WhenGivenPartialAnnotation_SetsAnnotation() {
        let point: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 37.7749, longitude: -122.4194)
        
        // Partial annotation = partially populate attributes for annotation; leave some attributes as Nil
        let partialAnnotation1 = Annotation(coordinate: point, title: "Foo1")
        let partialAnnotation2 = Annotation(coordinate: point, subtitle: "SubFoo2")
        
        XCTAssertNotEqual(partialAnnotation1, partialAnnotation2, " should not be identical annotations")
    }

}
