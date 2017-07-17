//
//  TileOverlayViewController.swift
//  MAMapKit_3D_Demo
//
//  Created by shaobin on 16/10/9.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

import UIKit

class TileOverlayViewController: UIViewController,  MAMapViewDelegate {
    
    var mapView: MAMapView!
    var tileOverlay: MATileOverlay!
    var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        initMapView()
        initToolBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.changeTypeAction(segmentControl: self.segmentControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setToolbarHidden(false, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func initToolBar() {
        let flexbleItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        //
        segmentControl = UISegmentedControl.init(items: ["Local","Remote"])
        segmentControl.bounds = CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width - 100, height: 36)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(self.changeTypeAction), for: UIControlEvents.valueChanged)
        
        let mayTypeItem = UIBarButtonItem.init(customView: segmentControl)
        
        self.toolbarItems = [flexbleItem, mayTypeItem, flexbleItem];
    }
    
    func initMapView() {
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.zoomLevel = 13
        self.view.addSubview(mapView)
    }
    
    func buildOverlay(type:UInt) -> MATileOverlay! {
        var tileOverlay:MATileOverlay!
        if (type == 0)
        {
            tileOverlay = LocalTileOverlay.init()
            tileOverlay.minimumZ = 4;
            tileOverlay.maximumZ = 17;
        }
        else // type == 1
        {
            tileOverlay = MATileOverlay.init(urlTemplate: "http://cache1.arcgisonline.cn/arcgis/rest/services/ChinaCities_Community_BaseMap_ENG/BeiJing_Community_BaseMap_ENG/MapServer/tile/{z}/{y}/{x}")
            
            /* minimumZ 是tileOverlay的可见最小Zoom值. */
            tileOverlay.minimumZ = 11;
            /* minimumZ 是tileOverlay的可见最大Zoom值. */
            tileOverlay.maximumZ = 13;
            
            /* boundingMapRect 是用来 设定tileOverlay的可渲染区域. */
            tileOverlay.boundingMapRect = MAMapRectWorld;
        }
    
        return tileOverlay;
    }
    
    //MARK: - MAMapViewDelegate
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        
        if (overlay.isKind(of: MATileOverlay.self))
        {
            let renderer = MATileOverlayRenderer.init(tileOverlay: overlay as! MATileOverlay!)
            return renderer;
        }
        
        return nil;
    }
    
    //MARK: - event handling
    func changeTypeAction(segmentControl: UISegmentedControl) {
        /* 删除之前的楼层. */
        self.mapView.remove(self.tileOverlay)
        
        /* 添加新的楼层. */
        self.tileOverlay = self.buildOverlay(type: UInt(segmentControl.selectedSegmentIndex))
        
        
        self.mapView.add(self.tileOverlay)
    }
}

