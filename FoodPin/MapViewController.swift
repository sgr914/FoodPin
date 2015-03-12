//
//  MapViewController.swift
//  FoodPin
//
//  Created by sgr on 15/3/11.
//  Copyright (c) 2015年 com.cnipr. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { (placeMarks, error) in
            
            if error != nil
            {
                println(error)
                return
            }
            
            if placeMarks != nil && placeMarks.count > 0
            {
                let placeMark = placeMarks[0] as CLPlacemark
                
                //add Annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                annotation.coordinate = placeMark.location.coordinate
                
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
            }
            
        })
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MapView Delegate
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) { return nil }
        
        //reuse annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        
        if annotationView == nil
        {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView.canShowCallout = true
        }
        
        println(restaurant.image)
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView.leftCalloutAccessoryView = leftIconView
        
        return annotationView
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
