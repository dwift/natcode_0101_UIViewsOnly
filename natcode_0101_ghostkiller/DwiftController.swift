//
//  DwiftController.swift
//  natcode_0101_ghostkiller
//
//  Created by Carlyn Maw on 6/23/17.
//  Copyright © 2017 carlynorama. No rights reserved.
//

import UIKit

class DwiftController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var dwiftView: DwiftView!
    
    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.dwiftView)
    
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var push: UIPushBehavior!
    
    //var physics: UIDynamicItemBehavior!
    
    private lazy var physics: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.elasticity = 1
        behavior.allowsRotation = true
        behavior.friction = 0
        behavior.resistance = 0
        return behavior
    }()
    
    private var balls: [BallView] {
        return dwiftView.subviews.flatMap { $0 as? BallView }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gravity = UIGravityBehavior(items: dwiftView.subviews)
        animator.addBehavior(gravity)
        
        push = UIPushBehavior(items: dwiftView.subviews, mode: .instantaneous)
        push.angle = -1*CGFloat.pi/2.8
        push.magnitude = 0.7
        animator.addBehavior(push)
        
        for ball in balls {
            physics.addItem(ball)
        }
        animator.addBehavior(physics)
        
        collision = UICollisionBehavior(items: dwiftView.subviews)
        collision.collisionDelegate = self
        // add a boundary that has the same frame as the barrier
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animator.removeAllBehaviors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

