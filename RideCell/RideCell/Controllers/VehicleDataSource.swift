//
//  VehicleDataSource.swift
//  RideCell
//
//  Created by Larry Bulen on 7/24/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import UIKit

class VehicleDataSource: NSObject, UICollectionViewDataSource {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var vehicles = [Vehicle]()
    
// UICollectionViewDataSource - delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.VehicleCollectionViewCell, for: indexPath as IndexPath) as! VehicleCollectionViewCell
        switch (vehicles[indexPath.row].model?.lowercased()) {
        case "10fttruck":
            cell.updateWithImage(UIImage.init(named: "uhaul-10ft-truck")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0)))
        case "15fttruck":
            cell.updateWithImage(UIImage.init(named: "uhaul-15ft-truck")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0)))
        case "17fttruck":
            cell.updateWithImage(UIImage.init(named: "uhaul-17ft-truck")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0)))
        case "cargovan":
            cell.updateWithImage(UIImage.init(named: "uhaul-cargovan")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0)))
        case "pickup":
            cell.updateWithImage(UIImage.init(named: "uhaul-pickup")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0)))
        default:
            cell.updateWithImage(UIImage.init(named: "uhaul-cargovan")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0)))
        }

        return cell
    }
}
