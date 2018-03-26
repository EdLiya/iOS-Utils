//
//  EasingViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/24.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class EasingViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    
    @IBOutlet weak var redSquare: UIView!
    
    @IBOutlet weak var greenSquare: UIView!
    
    @IBOutlet weak var yellowSquare: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /*
    我的理解:
     ease就是缓慢的一起,EaseIn 就是刚开始的时候慢,其余部分线性?
     EaseInOut 就出刚开始后接受部分慢, 其余线性?
    */

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
        }
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.yellowSquare.center.x = self.view.bounds.width - self.yellowSquare.center.x
        }, completion: nil)
    }

}
