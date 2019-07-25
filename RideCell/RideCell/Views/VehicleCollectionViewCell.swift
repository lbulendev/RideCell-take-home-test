//
//  VehicleCollectionViewCell.swift
//  RideCell
//
//  Created by Larry Bulen on 7/24/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import UIKit

class VehicleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!

    func updateWithImage(_ image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.VehicleCollectionViewCell, for: indexPath as IndexPath) as! VehicleCollectionViewCell
        cell.updateWithImage(UIImage.init(named: "uhaul-pickup"))
        return cell
    }
}
