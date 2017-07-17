//
//  StereoOverlayViewController.swift
//  MAMapKit_3D_Demo
//
//  Created by shaobin on 16/10/9.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

import UIKit

class StereoOverlayViewController: UIViewController, MAMapViewDelegate {

    var mapView: MAMapView!
    var cubeOverlay: CubeOverlay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        initMapView()
        initOverlays()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView.add(cubeOverlay)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func initMapView() {
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
    }
    
    func initOverlays() {
        cubeOverlay = CubeOverlay.init(center: CLLocationCoordinate2DMake(39.99325, 116.473209), lengthOfSide: 5000.0)
    }
    
    //MARK: - MAMapViewDelegate
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if (overlay.isKind(of: CubeOverlay.self))
        {
            let renderer = CubeOverlayRenderer.init(cubeOverlay: overlay as! CubeOverlay!)
            
            return renderer;
        }
        
        return nil;
    }
}
