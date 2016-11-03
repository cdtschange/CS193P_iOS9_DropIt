//
//  NamedBezierPathsView.swift
//  DropIt
//
//  Created by Mao on 03/11/2016.
//  Copyright © 2016 cdts. All rights reserved.
//

import UIKit

class NamedBezierPathsView: UIView {

    var bezierPaths = [String: UIBezierPath]() {
        didSet { setNeedsDisplay() }
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        for (_, path) in bezierPaths {
            path.stroke()
        }
    }

}
