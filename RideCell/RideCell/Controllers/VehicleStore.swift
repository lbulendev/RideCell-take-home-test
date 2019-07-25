//
//  VehicleStore.swift
//  RideCell
//
//  Created by Larry Bulen on 7/24/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import UIKit

enum VehicleResult {
    case success([Vehicle])
    case failure(Error)
}

enum ImageError: Error {
    case imageCreationError
}

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

let jsonString = """
{ "results" :
[
{
        "id": "A0001",
        "license_plate": "ABC123",
        "license_state": "CA",
        "vehicle_id": "ABCDEFG",
        "car_class": "T",
        "color": "White",
        "year": "2006",
        "make": "Truck",
        "model": "Pickup",
        "charge_level": 0.0,
        "fuel_level": 0.75,
        "num_of_seats": 3,
        "fuel_cap": 15,
        "fleet_id": "U0001",
        "lat": 37.774,
        "lon": -122.419
    },
    {
        "id": "A0002",
        "license_plate": "123ABC",
        "license_state": "CA",
        "vehicle_id": "123456",
        "car_class": "T",
        "color": "White",
        "year": "2010",
        "make": "Truck",
        "model": "CargoVan",
        "charge_level": 0.0,
        "fuel_level": 0.75,
        "num_of_seats": 3,
        "fuel_cap": 20,
        "fleet_id": "U0001",
        "lat": 37.7749,
        "lon": -122.4194
    },
    {
        "id": "A0003",
        "license_plate": "A1B2C3",
        "license_state": "NV",
        "vehicle_id": "AAAA1111",
        "car_class": "T",
        "color": "White",
        "year": "2018",
        "make": "Truck",
        "model": "15fttruck",
        "charge_level": 0.0,
        "fuel_level": 0.75,
        "num_of_seats": 2,
        "fuel_cap": 20,
        "fleet_id": "U0001",
        "lat": 37.7745,
        "lon": -122.4199
    }
]

}
"""

class VehicleStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    private func processVehicleRequest(data: Data?, error: Error?) -> VehicleResult {
// ****** Included this section of code to work around non-existent website
        var localData: Data?
        if (error != nil) {
            localData = Data(jsonString.utf8)
        } else {
            localData = data
        }
// ******************
//        guard let jsonData = data else {
        guard let jsonData = localData else {
            return .failure(error!)
        }
        
        return VehicleAPI.vehicles(fromJSON: jsonData)
    }

    func fetchVehciles(completion: @escaping (VehicleResult) -> Void) {

        let url = VehicleAPI.nearbyVehicleURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            
            let result = self.processVehicleRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        })
        task.resume()
    }

    func reserveVehicle(_ vehicle: Vehicle, completion: @escaping (VehicleResult) -> Void) {
//        let url = VehicleAPI.reserveVehicle(vehicle)
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request, completionHandler: {
//            (data, response, error) -> Void in
//
//            let result = self.processVehicleRequest(data: data, error: error)
//            OperationQueue.main.addOperation {
//                completion(result)
//            }
//        })
//        task.resume()
    }
}
