//
//  DwiftView.swift
//  natcode_0101_ghostkiller
//
//  Created by Carlyn Maw on 6/23/17.
//  Copyright © 2017 carlynorama. All rights reserved.
//

import UIKit

//https://marcosantadev.com/calayer-auto-layout-swift/

@IBDesignable
class DwiftView: UIView {
    
    
//    override public class var layerClass: Swift.AnyClass {
//        return CAGradientLayer.self
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
//        gradientLayer.colors = [
//            UIColor.blue.cgColor,
//            UIColor.cyan.cgColor
//        ]
 //   }
    
    func setupLayer() {
        
        //the backgroundcolor property gets set during viewWillLoad/viewDidLoad?
        //apparently can't be updated after. If call setuplayer in parent
        //view did load, can use background color but won't see it in
        //interfface builder.
        let easyChangeBackground = CAGradientLayer()
        easyChangeBackground.frame = bounds
        easyChangeBackground.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
        layer.insertSublayer(easyChangeBackground, at: 0)
        
        
        layer.borderWidth = 10.0
        layer.borderColor = UIColor.red.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
        
        
        let circleSize = CGSize(width: 50.0, height: 50.0)
        let circlePosition = CGPoint(x:bounds.midX, y:bounds.midY)
        let circleFrame = CGRect(origin: center, size: circleSize)
        let circle = UIView(frame: circleFrame)
        circle.center = circlePosition
        circle.layer.cornerRadius = 25.0
        
        let startingColor = UIColor(red: (253.0/255.0), green: (159.0/255.0), blue: (47.0/255.0), alpha: 1.0)
        circle.backgroundColor = startingColor
        
        addSubview(circle);
        
    }

    override func draw(_ rect: CGRect) {
        setupLayer()
        //drawCircle()
    }
    
//    func drawCircle() {
//        let myCircle = bezCircle(at: center, ofRadius: 50)
//        UIColor.black.setFill()
//        myCircle.fill()
//        print("Where am I?")
//        print(myCircle.bounds)
//        
//    }
    
    
//    
//    func bezCircle(at location:CGPoint, ofRadius radius:CGFloat) -> UIBezierPath {
//        let path =  UIBezierPath(arcCenter: location, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
//        path.close()
//        return path
//    }

    



    
}
