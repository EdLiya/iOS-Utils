//
//  RotationViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/23.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var wheel: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        snip()
    }

    func snip() {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
            self.wheel.transform = CGAffineTransform(rotationAngle: .pi)
        }) { (finished) in
            // 这里不推荐这么做, 而且这样iOS 11以后并不能无效旋转
            self.snip()
        }
    }
    
}
