//
//  ColorViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 4/30/15.
//  Copyright (c) 2015 JakeLin. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.blueSquare.backgroundColor = UIColor.red
            self.nameLabel.textColor = UIColor.white
        }
        
    }


}
