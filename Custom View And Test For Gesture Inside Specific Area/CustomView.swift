//
//  HomeButton.swift
//  BleedMed
//
//  Created by Writayan Das on 14/04/17.
//  Copyright © 2017 Writayan Das. All rights reserved.
//

import UIKit

class HomeButtonView: UIView {
    
    @IBInspectable var fillColor: UIColor = .white
    var rectTemp : CGRect!
    var context : UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        //  guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context = UIBezierPath()
        
        //        let tap = UITapGestureRecognizer()
        //        tap.addTarget(self, action: #selector(handleTap(tap:)))
        //
        //        self.addGestureRecognizer(tap)
        
        //  context.beginPath()
        context.move(to: CGPoint(x: rect.maxX/2, y: rect.minY+2))
        context.addLine(to: CGPoint(x: rect.minX+2, y: rect.maxY/2))
        context.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY-2))
        context.addLine(to: CGPoint(x: rect.maxX-2, y: rect.maxY/2))
        // context.closePath()
        
        super.backgroundColor = .clear
        //context.setFillColor(fillColor.cgColor)
        
        fillColor.setFill()
        context.fill()
        // context.fillPath()
        
        rectTemp = context.cgPath.boundingBox
        
    }
    
    //     func handleTap(tap: UITapGestureRecognizer) {
    //        let points = tap.location(in: self)
    //
    //        print(containsPoint(points, path: context, inFillArea: true))
    //        let vc = HomeVC()
    //        vc.didTapOnDoc()
    //    }
    
    func containsPoint(_ point: CGPoint, path: UIBezierPath, inFillArea: Bool = true, v:UIView) -> Bool {
        
        UIGraphicsBeginImageContext(v.frame.size)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        let pathToTest = path.cgPath
        var isHit = false
        
        var mode: CGPathDrawingMode = CGPathDrawingMode.stroke
        
        if inFillArea {
            
            // check if UIBezierPath uses EO fill
            if path.usesEvenOddFillRule {
                mode = CGPathDrawingMode.eoFill
            } else {
                mode = CGPathDrawingMode.fill
            }
        } // else mode == stroke
        
        context?.saveGState()
        context?.addPath(pathToTest)
        
        isHit = (context?.pathContains(point, mode: mode))!
        context?.restoreGState()
        
        return isHit
    }
    
}


