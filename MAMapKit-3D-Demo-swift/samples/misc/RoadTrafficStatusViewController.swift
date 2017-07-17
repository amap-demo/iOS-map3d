//
//  RoadTrafficStatusViewController.swift
//  MAMapKit_3D_Demo
//
//  Created by shaobin on 2017/4/13.
//  Copyright © 2017年 Autonavi. All rights reserved.
//

import UIKit

class MARoadStatusPolyline: NSObject, MAOverlay {
    public var color: UIColor?
    public var polyline: MAPolyline?
    
    public var coordinate: CLLocationCoordinate2D { return (polyline?.coordinate)! }
    
    public var boundingMapRect: MAMapRect { return (polyline?.boundingMapRect)! }
}

class RoadTrafficStatusViewController: UIViewController, MAMapViewDelegate, AMapSearchDelegate {
    
    var searchBar: UISearchBar!
    var search: AMapSearchAPI!
    var mapView: MAMapView!
    var response: AMapRoadTrafficSearchResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        initMapView()
        initSearch()
        
        // 发起一次请求
        searchRoadTrafficStatus()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    func initSearch() {
        search = AMapSearchAPI()
        search.delegate = self
    }
    
    func searchRoadTrafficStatus() {
        
        let request = AMapRoadTrafficSearchRequest()
        request.roadName = "酒仙桥路"
        
        // 显示商圈，而不是街道
        request.requireExtension = true
        request.adcode = "110000"
        
        search.aMapRoadTrafficSearch(request)
    }
    
    //MARK: - MAMapViewDelegate
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay.isKind(of: MARoadStatusPolyline.self) {
            let roadLine : MARoadStatusPolyline! = overlay as! MARoadStatusPolyline
            let renderer: MAPolylineRenderer = MAPolylineRenderer(overlay: roadLine.polyline)
            renderer.lineWidth = 6.0
            renderer.strokeColor = roadLine.color
            
            return renderer
        }
        
        return nil
    }
    
    //MARK: - AMapSearchDelegate
    
    func aMapSearchRequest(_ request: Any!, didFailWithError error: Error!) {
        let nsErr:NSError? = error as NSError
        NSLog("Error:\(error) - \(ErrorInfoUtility.errorDescription(withCode: (nsErr?.code)!))")
    }
    
    func onRoadTrafficSearchDone(_ request: AMapRoadTrafficSearchRequest!, response: AMapRoadTrafficSearchResponse!) {
        self.response = response
        
        self.presentCurrentRoadStatus()
    }
    
    func presentCurrentRoadStatus() {
        if(self.response == nil) {
            return
        }
        
        var bounds: MAMapRect = MAMapRectZero
        for road: AMapTrafficRoad in response.trafficInfo.roads {
            let polylineStr: String = road.polyline
            let polyLine: MAPolyline? = CommonUtility.polyline(forCoordinateString: polylineStr)
            let roadPolyLine = MARoadStatusPolyline()
            roadPolyLine.polyline = polyLine
            if road.status == 1 {
                roadPolyLine.color = UIColor.green
            }
            else if road.status == 2 {
                roadPolyLine.color = UIColor.yellow
            }
            else if road.status == 3 {
                roadPolyLine.color = UIColor.red
            }
            else {
                roadPolyLine.color = UIColor.blue
            }
            
            self.mapView.add(roadPolyLine)
            bounds = MAMapRectUnion(bounds, (polyLine?.boundingMapRect)!)
        }
        mapView.setVisibleMapRect(bounds, animated: true)
    }
}
