//
//  ViewController.swift
//  自定义转场
//
//  Created by Zhengsw on 2018/3/25.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func next (_ sender: AnyObject) {
        
        let sb = UIStoryboard(name: "OneViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = baseAnimator
        vc?.modalPresentationStyle = .custom
        present(vc!, animated: true, completion: nil)
        
        
    }

    // 一定要定义一个属性来报错自定义转场对象, 否则会报错
    private lazy var baseAnimator: BaseAnimator = {
        let pa = BaseAnimator()
        pa.testString = "测试"
        return pa
    }()
}

