//
//  SpringViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/24.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class SpringViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    
    @IBOutlet weak var redSquare: UIView!
    
    @IBOutlet weak var greenSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
        }
        
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: [], animations: {
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }, completion: nil)
        
        // Damping 阻尼 0~1 1摆动最近, 0阻尼最小 oscillation弹性振幅最大
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: [], animations: {
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
        }, completion: nil)
        
    }

}
