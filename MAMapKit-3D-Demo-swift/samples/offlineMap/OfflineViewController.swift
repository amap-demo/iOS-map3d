//
//  OfflineViewController.swift
//  MAMapKit_3D_Demo
//
//  Created by shaobin on 16/10/11.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

import UIKit

class OfflineViewController: UIViewController , MAMapViewDelegate {
    
    var mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "城市列表", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.detailAction))
        
        // Do any additional setup after loading the view.
        initMapView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func initMapView() {
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.view.addSubview(mapView)
    }
    
    func detailAction() {
        let detailViewController = OfflineDetailViewController.init()
        detailViewController.mapView = mapView
        detailViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        let navi = UINavigationController.init(rootViewController: detailViewController)
        self.present(navi, animated: true, completion: nil)
    }
    
    //MARK: - mapview delegate
    
}
