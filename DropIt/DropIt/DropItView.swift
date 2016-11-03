//
//  DroItView.swift
//  DropIt
//
//  Created by Mao on 03/11/2016.
//  Copyright © 2016 cdts. All rights reserved.
//

import UIKit

class DropItView: UIView {
    
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    
    private let dropBehavior = FallingObjectBehavior()
    
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(dropBehavior)
            } else {
                animator.removeBehavior(dropBehavior)
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
        dropBehavior.addItem(drop)
    }

}
