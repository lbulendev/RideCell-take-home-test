//
//  MainViewController.swift
//  RideCell
//
//  Created by Larry Bulen on 7/22/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, UICollectionViewDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cityMpgLabel: UILabel!
    @IBOutlet weak var hwyMpgLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var reserveButton: UIButton!

    @IBAction func reserveCarButtonClicked(_ sender: Any) {
        if selectedVehicle != nil {
            print("selected Car.license plate: \(selectedVehicle!.licensePlate)")
        }
    }

    var vehicleDataSource = VehicleDataSource()
    var store: VehicleStore!
    var selectedVehicle: Vehicle? = nil

    required init?(coder aDecoder: NSCoder) {
        store = VehicleStore()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = vehicleDataSource
        collectionView.delegate = self
        mapView.delegate = self
        
        store.fetchVehciles{(vehicleResult) -> Void in
            switch vehicleResult {
            case let .success(vehicles):
                print("Successfully found \(vehicles.count) vehicles.")
                self.vehicleDataSource.vehicles = vehicles
                self.collectionView.reloadData()
                for vehicle in vehicles {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = vehicle.coordinate!
                    annotation.title = vehicle.licensePlate
//                    annotation.title = vehicle.licenseState! + " " + vehicle.licensePlate
                    annotation.subtitle = String(vehicle.year ?? "") + " " + String(vehicle.make ?? "") + " " + String(vehicle.model ?? "")
                    self.mapView.addAnnotation(annotation)
                }
                self.mapView.fitAll()
            case let .failure(error):
                print("error: \(error)")
            }
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = ImageAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            annotationView!.image = UIImage.init(named: "MapPin")?.resizeImageWith(newSize: CGSize.init(width: 50.0, height: 50.0))
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard view is ImageAnnotationView else { return }
        if let annotationTitle = view.annotation?.title
        {
            for vehicle in self.vehicleDataSource.vehicles {
                if annotationTitle == vehicle.licensePlate {
                    selectedVehicle = vehicle
                    tappedCellAnnotation()
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        for annotations_item in mapView.annotations{
            
            if annotations_item.title == self.vehicleDataSource.vehicles[indexPath.row].licensePlate {
                self.mapView.selectAnnotation(annotations_item, animated: true)
            }
            
        }
        selectedVehicle = self.vehicleDataSource.vehicles[indexPath.row]
        tappedCellAnnotation()
    }

    func tappedCellAnnotation() {
        self.cityMpgLabel.text = String(selectedVehicle!.fuelCap!)
        self.hwyMpgLabel.text = String(selectedVehicle!.fuelLevel!)
        self.driverLabel.text = String(selectedVehicle!.licensePlate)
        self.fuelLabel.text = String(selectedVehicle!.fuelCap!) + "MPG"
    }
}

extension MKMapView {
    
    /// When we call this function, we have already added the annotations to the map, and just want all of them to be displayed.
    func fitAll() {
        var zoomRect            = MKMapRect.null;
        for annotation in annotations {
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect       = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.01, height: 0.01);
            zoomRect            = zoomRect.union(pointRect);
        }
        setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
    }
    
    /// We call this function and give it the annotations we want added to the map. we display the annotations if necessary
    func fitAll(in annotations: [MKAnnotation], andShow show: Bool) {
        var zoomRect:MKMapRect  = MKMapRect.null
        
        for annotation in annotations {
            let aPoint          = MKMapPoint(annotation.coordinate)
            let rect            = MKMapRect(x: aPoint.x, y: aPoint.y, width: 0.1, height: 0.1)
            
            if zoomRect.isNull {
                zoomRect = rect
            } else {
                zoomRect = zoomRect.union(rect)
            }
        }
        if(show) {
            addAnnotations(annotations)
        }
        setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
    }
    
}
