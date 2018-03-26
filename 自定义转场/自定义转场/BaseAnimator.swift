//
//  BaseAnimator.swift
//  自定义转场
//
//  Created by Zhengsw on 2018/3/25.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class BaseAnimator: NSObject, UIViewControllerTransitioningDelegate {

     var isPresent : Bool = false
    
    var testString = "001"
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print(testString)
        let onePC = OnePresentationController(presentedViewController: presented, presenting: presenting)
        onePC.testString = testString
        
        return onePC
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
}

extension BaseAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 从底部展现
        if isPresent {
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            transitionContext.containerView.addSubview(toView!)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView?.transform.ty -= 250
                
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
            
        } else {
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                fromView?.transform.ty += 250
                
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        }
        /*
         // 从中间展现
        if isPresent {
            // 获得要展现的视图
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            transitionContext.containerView.addSubview(toView!)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView?.transform = CGAffineTransform.identity
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        } else {
            // TODO fadeOut 效果尝试
            
            transitionContext.completeTransition(true)
            /*
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: 0.1, animations: {
                fromView?.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
//                fromView?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
 */
        }
 */
    }
    
    
}
