//
//  BallView.swift
//  natcode_0101_ghostkiller
//
//  Created by Carlyn Maw on 6/23/17.
//  Copyright © 2017 carlynorama. All rights reserved.
//

import UIKit

@IBDesignable
class BallView: UIView {

  
    
        convenience init() {
            self.init(frame: CGRect.zero)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUp()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setUp()
        }
        
        override func setNeedsLayout() {
            setUp()
        }
        
        func setUp() {
            let circleFrame = bounds
            let circle = UIView(frame: circleFrame)
            circle.center = center
            circle.layer.cornerRadius = 25.0
            
            let startingColor = UIColor(red: (253.0/255.0), green: (159.0/255.0), blue: (47.0/255.0), alpha: 1.0)
            circle.backgroundColor = startingColor
            
            addSubview(circle);
            
        }
        
        //    override func draw(_ rect: CGRect) {
        //       // setUp()
        //    }
        
        
}
