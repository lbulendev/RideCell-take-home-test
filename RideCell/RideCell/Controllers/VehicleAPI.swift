//
//  VehicleAPI.swift
//  RideCell
//
//  Created by Larry Bulen on 7/24/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import Foundation
import CoreLocation

enum VehicleError: Error {
    case invalidJSONData
}

struct VehicleAPI {
    private static let baseURLString = "https://api.fake-ridecell.com/discover/vehicle"
//    private static let baseURLString = "https://api.themoviedb.org/3/discover/movie"
    private static let apiKey = "ab41356b33d100ec61e6c098ecc92140"

//    https://api.fake-ridecell.com/discover/vehicle?api_key=ab41356b33d100ec61e6c098ecc92140&lat=37.7749&lon=-122.4194&radius=500
    static var nearbyVehicleURL: URL {
        return vehicleURL(parameters: ["lat": "37.7749", "lon": "-122.4194", "radius": "500"])
 //       return vehicleURL(parameters: ["sort_by": "popularity.desc"])
    }

    func reserveVehicle(_ vehicle: Vehicle) -> URL {
        return VehicleAPI.vehicleURL(parameters: ["vehicle": vehicle.id])
    }

    private static func vehicleURL(parameters: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "api_key": apiKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
    }

    static func vehicles(fromJSON data: Data) -> VehicleResult {
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let vehicleArray = jsonDictionary["results"] as? [[String:Any]] else {
                    
                    // The JSON structure doesn't match our expectations
                    return .failure(VehicleError.invalidJSONData)
            }
            
            var finalVehicles = [Vehicle]()
            for vehicleJSON in vehicleArray {
                if let vehicle = vehicle(fromJSON: vehicleJSON) {
                    finalVehicles.append(vehicle)
                }
            }
            
            if finalVehicles.isEmpty && !vehicleArray.isEmpty {
                // No vehicles?
                return .failure(VehicleError.invalidJSONData)
            }
            return .success(finalVehicles)
        } catch let error {
            return .failure(error)
        }
    }

    private static func vehicle(fromJSON json: [String : Any]) -> Vehicle? {
        guard
            let id = json["id"] as? String,
            let licensePlate = json["license_plate"] as? String,
            let licenseState = json["license_state"] as? String,
            let VIN = json["vehicle_id"] as? String,
            let carClass = json["car_class"] as? String,
            let year = json["year"] as? String,
            let color = json["color"] as? String,
            let make = json["make"] as? String,
            let model = json["model"] as? String,
            let chargeLevel = json["charge_level"] as? Float,
            let fuelLevel = json["fuel_level"] as? Float,
            let numOfSeats = json["num_of_seats"] as? Int,
            let fuelCap = json["fuel_cap"] as? Int,
            let fleetID = json["fleet_id"] as? String,
            let lat = json["lat"] as? Double,
            let lon = json["lon"] as? Double else {
                
                // Don't have enough information to construct a Vehicle
                return nil
        }
        let coordinate = CLLocationCoordinate2D.init(latitude: lat, longitude: lon)

        return Vehicle(id: id, licensePlate: licensePlate, licenseState: licenseState, VIN: VIN, carClass: carClass, color: color, year: year, make: make, model: model, chargeLevel: chargeLevel, fuelLevel: fuelLevel, numOfSeats: numOfSeats, fuelCap: fuelCap, fleetID: fleetID, coordinate: coordinate)
    }
}
extension NSNumber {
    var isBool: Bool {
        return type(of: self) == type(of: NSNumber(booleanLiteral: true))
    }
}
