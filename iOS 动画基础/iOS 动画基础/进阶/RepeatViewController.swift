//
//  RepeatViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/23.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class RepeatViewController: UIViewController {

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
        
        // 到终点后消失 --> 从起点出现再次执行动画(很突兀)
        UIView.animate(withDuration: 1, delay: 0, options: .repeat, animations: {
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }, completion: nil)
        
        /*
        autoreverse: Run the animation backwards and forwards (must be combined with the repeat option).
         可以自动的从终点原路返回起点,autoreverse 必须和 repeat 搭配使用
        */
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
        }, completion: nil)
        
    }
    



}
