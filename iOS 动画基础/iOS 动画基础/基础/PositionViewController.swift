//
//  PositionViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/23.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {

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
        
      
        UIView.animate(withDuration: 1, delay: 0.2, options: [], animations: {
            self.redSquare.center.y = self.view.bounds.height - self.redSquare.center.y
        }, completion: nil)
        
        
        UIView.animate(withDuration: 1, delay: 1, options: [], animations: {
            
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
            self.greenSquare.center.y  = self.view.bounds.height - self.greenSquare.center.y
        }, completion: nil)
        
       
    }

}
