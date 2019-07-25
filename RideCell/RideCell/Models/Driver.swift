//
//  Driver.swift
//  RideCell
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import Foundation

struct Driver: Equatable {
    var id: String
    var licenseNum: String
    var licenseState: String
    var licenseExp: Date
    var licenseClass: String
    var photo: String?
    var firstName: String?
    var lastName: String?
    
    init(id: String,
         licenseNum: String,
         licenseState: String,
         licenseExp: Date,
         licenseClass: String,
         photo: String? = nil,
         firstName: String? = nil,
         lastName: String? = nil) {
        self.id = id
        self.licenseNum = licenseNum
        self.licenseState = licenseState
        self.licenseExp = licenseExp
        self.licenseClass = licenseClass
        self.photo = photo
        self.firstName = firstName
        self.lastName = lastName
    }
}

func ==(lhs: Driver, rhs: Driver) -> Bool {
    if (lhs.id != rhs.id) {
        return false
    }
    if (lhs.licenseNum != rhs.licenseNum) {
        return false
    }
    if (lhs.licenseState != rhs.licenseState) {
        return false
    }
    if (lhs.licenseExp != rhs.licenseExp) {
        return false
    }
    if (lhs.licenseClass != rhs.licenseClass) {
        return false
    }
    if (lhs.photo != rhs.photo) {
        return false
    }
    if (lhs.firstName != rhs.firstName) {
        return false
    }
    if (lhs.lastName != rhs.lastName) {
        return false
    }
    return true
}
