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
        //drawBall()
        
    }

    override func draw(_ rect: CGRect) {
        //setUp()
        drawBall()
    }
    
    func drawBall() {
        let ballSize = CGSize(width: 50.0, height: 50.0)
        //let ballStartX = frame.width/2
        //let ballPosition = CGPoint(x:ballStartX, y:0)
        let ballPosition = bounds.origin
        
        let ballFrame = CGRect(origin: ballPosition, size: ballSize)
        
        let ball = BallView(frame: ballFrame)
        addSubview(ball)
        
        //works in both draw and init
        ball.center = CGPoint(x: bounds.midX, y: bounds.midY);
        
        //works in draw, not in init.
        //ball.center = convert(center, from: superview)
        
    }
    

    



    
}
