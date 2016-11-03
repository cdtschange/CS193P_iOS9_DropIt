//
//  DropItViewController.swift
//  DropIt
//
//  Created by Mao on 03/11/2016.
//  Copyright © 2016 cdts. All rights reserved.
//

import UIKit

class DropItViewController: UIViewController {

    @IBOutlet weak var gameView: DropItView! {
        didSet {
            gameView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addDrop(_:))))
        }
    }
    
    func addDrop(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .Ended {
            gameView.addDrop()
        }
    }
    
}
