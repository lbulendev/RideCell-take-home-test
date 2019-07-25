//
//  Constants.swift
//  RideCell
//
//  Created by Larry Bulen on 7/24/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import UIKit

struct Constants {
    struct CellIdentifiers {
        static let VehicleCollectionViewCell: String = "UICollectionViewCell"
    }
    
    struct Colors {
        static let blueButtonColor = UIColor(0x27488A, 1.0)
    }
}
extension UIColor {
    convenience init(_ color: Int, _ alpha: CGFloat) {
        let newRed = CGFloat((color & 0xFF0000) >> 16)/255.0
        let newGreen = CGFloat((color & 0xFF00) >> 8)/255.0
        let newBlue = CGFloat((color & 0xFF))/255.0
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

extension UIImage{
    
    func resizeImageWith(newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        //        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
}
