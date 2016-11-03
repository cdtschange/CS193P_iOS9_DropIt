//
//  DroItView.swift
//  DropIt
//
//  Created by Mao on 03/11/2016.
//  Copyright © 2016 cdts. All rights reserved.
//

import UIKit

class DropItView: UIView {
    
    private let gravity = UIGravityBehavior()
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(gravity)
                animator.addBehavior(collider)
            } else {
                animator.removeBehavior(gravity)
                animator.removeBehavior(collider)
            }
        }
    }

    private let dropsPerRow = 10
    
    private var dropSize: CGSize {
        let size = bounds.size.width / CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    func addDrop() {
        var frame = CGRect(origin: CGPoint.zero, size: dropSize)
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        
        addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
    }

}
