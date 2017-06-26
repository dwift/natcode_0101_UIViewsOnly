//
//  DwiftView.swift
//  natcode_0101_ghostkiller
//
//  Created by Carlyn Maw on 6/23/17.
//  Copyright © 2017 carlynorama. No rights reserved
//

import UIKit

//https://marcosantadev.com/calayer-auto-layout-swift/

@IBDesignable
class DwiftView: UIView {
    
    @IBInspectable
    internal var colorForBackground: UIColor = UIColor(colorLiteralRed: 0.90, green: 0.90, blue: 0.90, alpha: 1) {
        didSet {
            self.backgroundColor = self.colorForBackground
        }
    }
    
    @IBInspectable
    internal var colorForBorder: UIColor = UIColor(colorLiteralRed: 0.80, green: 0.80, blue: 0.80, alpha: 1) {
        didSet {
            self.layer.borderColor = self.colorForBorder.cgColor
        }}
    
    @IBInspectable
    internal var sizeForBorder: CGFloat = 5 {
        didSet {
            self.layer.borderWidth = self.sizeForBorder
        }
    }
    
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
        self.backgroundColor = colorForBackground
        layer.borderWidth = sizeForBorder
        layer.borderColor = colorForBorder.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10.0
        initBall()
        
    }

    override func draw(_ rect: CGRect) {
        //updateBall(moveTo: convert(center, from: superview))
    }
    
    func initBall(){
        let ballSize = CGSize(width: 30.0, height: 30.0)
        let ballPosition = bounds.origin
        let ballFrame = CGRect(origin: ballPosition, size: ballSize)
        let ball = BallView(frame: ballFrame)
        addSubview(ball)
    
    }
    
    func updateBall(moveTo newLocation:CGPoint) {
        
        let currentBallViews = self.subviews.filter{$0 is BallView}
        let ball = currentBallViews[0]
        ball.center = newLocation
        
    }
    

    



    
}
