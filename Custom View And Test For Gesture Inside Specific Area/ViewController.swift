//
//  ViewController.swift
//  Custom View And Test For Gesture Inside Specific Area
//
//  Created by Nitin Bhatia on 20/09/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view3: HomeButtonView!
    @IBOutlet weak var view2: HomeButtonView!
    @IBOutlet weak var view1: HomeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
        view1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2(_:)))
        view2.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3(_:)))
        view3.addGestureRecognizer(tap3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   @objc func handleTap1(_ tap: UITapGestureRecognizer){
        let points = tap.location(in: view1)
        let vc = HomeButtonView()
       
        if vc.containsPoint(points,path: view1.context,v:view1) {
           print("tapped inside")
        } else {
            print("tapped outside")
        }
    }
    
    @objc func handleTap2(_ tap: UITapGestureRecognizer){
        let points = tap.location(in: view2)
        let vc = HomeButtonView()
        
        if vc.containsPoint(points,path: view2.context,v:view2) {
            print("tapped inside")
        } else {
            print("tapped outside")
        }
    }

    
    @objc func handleTap3(_ tap: UITapGestureRecognizer){
        let points = tap.location(in: view3)
        let vc = HomeButtonView()
        
        if vc.containsPoint(points,path: view3.context,v:view3) {
            print("tapped inside")
        } else {
            print("tapped outside")
        }
    }

}

