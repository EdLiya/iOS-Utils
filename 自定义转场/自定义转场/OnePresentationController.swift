//
//  OnePresentationController.swift
//  自定义转场
//
//  Created by Zhengsw on 2018/3/25.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit
import SnapKit


class OnePresentationController: UIPresentationController {

    var testString = "222"
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func containerViewWillLayoutSubviews() {
        print(testString)
        // 从底部展现
        presentedView?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(250)
            make.top.equalTo((containerView?.snp.bottom)!)
        })
        
        /*
         // 从中间展现
        presentedView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(250)
            make.center.equalToSuperview()
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(100)
        })
        */
        containerView?.insertSubview(coverView, at: 0)
    }
    
    /*
     Optional([AnyHashable("UIKeyboardCenterBeginUserInfoKey"): NSPoint: {187.5, 796}, AnyHashable("UIKeyboardIsLocalUserInfoKey"): 1, AnyHashable("UIKeyboardCenterEndUserInfoKey"): NSPoint: {187.5, 538}, AnyHashable("UIKeyboardBoundsUserInfoKey"): NSRect: {{0, 0}, {375, 258}}, AnyHashable("UIKeyboardFrameEndUserInfoKey"): NSRect: {{0, 409}, {375, 258}}, AnyHashable("UIKeyboardAnimationCurveUserInfoKey"): 7, AnyHashable("UIKeyboardFrameBeginUserInfoKey"): NSRect: {{0, 667}, {375, 258}}, AnyHashable("UIKeyboardAnimationDurationUserInfoKey"): 0.25])
     */
    @objc func keyboardWillShow(_ noti:Notification) {
        let info = noti.userInfo!
        let endframe = info[UIKeyboardFrameEndUserInfoKey] as! CGRect
        let duration = info[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        print(endframe)
        // 调整距离
        if (presentedView?.frame.maxY)! > endframe.origin.y {
            UIView.animate(withDuration: duration, animations: {
                
                self.presentedView?.frame.origin.y = (self.presentedView?.frame.maxY)! - endframe.origin.y
            })
            
        }
    }
    
    // MARK: - 懒加载
    private lazy var coverView: UIView = {
        // 1.创建view
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds

        // 2.添加监听
        let tap = UITapGestureRecognizer(target: self, action:#selector(close))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    @objc func close(){
        // presentedViewController拿到当前弹出的控制器
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
