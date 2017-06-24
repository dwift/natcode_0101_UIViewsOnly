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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gravity = UIGravityBehavior(items: dwiftView.subviews)
        animator.addBehavior(gravity)
        // Do any additional setup after loading the view, typically from a nib.
        
        collision = UICollisionBehavior(items: dwiftView.subviews)
        collision.collisionDelegate = self
        // add a boundary that has the same frame as the barrier
        collision.addBoundary(withIdentifier: "boundry" as NSCopying, for: UIBezierPath(rect: self.dwiftView.frame)) //reference problem
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

