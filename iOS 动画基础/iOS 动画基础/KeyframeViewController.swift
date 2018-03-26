//
//  KeyframeViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/26.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class KeyframeViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            // 1
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            })
            
            // 2
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
            })
            
            // 3
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            })
            
            // 4
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
            })
            
        }, completion: nil)
    }

}
