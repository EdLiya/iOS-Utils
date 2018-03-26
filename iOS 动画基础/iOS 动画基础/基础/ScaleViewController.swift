//
//  ScaleViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 4/30/15.
//  Copyright (c) 2015 JakeLin. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 1) {
            self.blueSquare.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }
        
    }


}
