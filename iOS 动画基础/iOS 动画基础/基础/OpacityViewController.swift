//
//  OpacityViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 4/30/15.
//  Copyright (c) 2015 JakeLin. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {
    @IBOutlet weak var blueSquare: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.blueSquare.alpha = 0.2
        }
        
    }
    
    
}
