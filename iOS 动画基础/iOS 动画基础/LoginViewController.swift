//
//  LoginViewController.swift
//  iOS 动画基础
//
//  Created by Zhengsw on 2018/3/24.
//  Copyright © 2018年 zyy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bunnle1: UIImageView!
    @IBOutlet weak var bunnle2: UIImageView!
    @IBOutlet weak var bunnle3: UIImageView!
    @IBOutlet weak var bunnle4: UIImageView!
    @IBOutlet weak var bunnle5: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var dot : UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login : UIButton!
    
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    var loginPosition = CGPoint.zero
    let warningMessage = UIImageView(image: #imageLiteral(resourceName: "Warning"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bunnle1.transform = CGAffineTransform(scaleX: 0, y: 0)
        bunnle2.transform = CGAffineTransform(scaleX: 0, y: 0)
        bunnle3.transform = CGAffineTransform(scaleX: 0, y: 0)
        bunnle4.transform = CGAffineTransform(scaleX: 0, y: 0)
        bunnle5.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        logo.center.x -= view.bounds.width
        dot.center.x -= view.bounds.width/2
        
        let paddingViewForUsername = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: username.frame.height))
        username.leftView = paddingViewForUsername
        username.leftViewMode = .always
        
        let paddingViewForPassword = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: password.frame.height))
        password.leftView = paddingViewForPassword
        password.leftViewMode = .always
        
        let userImageView = UIImageView(image: #imageLiteral(resourceName: "User"))
        userImageView.frame.origin = CGPoint(x: 13, y: 10)
        username.addSubview(userImageView)
        
        let passwordImageView = UIImageView(image: #imageLiteral(resourceName: "Key"))
        passwordImageView.frame.origin = CGPoint(x: 12, y: 9)
        password.addSubview(passwordImageView)
        
        username.center.x -= self.view.bounds.width
        password.center.x -= self.view.bounds.width
        
        loginPosition = login.center
        login.center.x -= view.bounds.width
        
        view.addSubview(warningMessage)
        warningMessage.isHidden = true
        warningMessage.center = loginPosition
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
            self.bunnle1.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bunnle4.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bunnle5.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
            self.bunnle2.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bunnle3.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
            self.logo.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 5, delay: 1, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: [], animations: {
            self.dot.center.x += self.view.bounds.width/2
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.6, options: .curveEaseOut, animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.7, options: .curveEaseOut, animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.8, options: .curveEaseOut, animations: {
            self.login.center.x += self.view.bounds.width
        }, completion: nil)
    }
 
    @IBAction func loginTapped(_ sender: UIButton) {
        login.addSubview(spinner)
        spinner.frame.origin = CGPoint(x: 12, y: 12)
        spinner.startAnimating()
        
        UIView.transition(with: warningMessage, duration: 0.3, options: .transitionFlipFromTop, animations: {
            self.warningMessage.isHidden = true
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.login.center = self.loginPosition
        }, completion: { _ in
            
            self.login.center.x -= 30
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: {
                self.login.center.x += 30
            }, completion: {finished in
                UIView.animate(withDuration: 0.3, animations: {
                    self.login.center.y += 90
                    self.spinner.removeFromSuperview()
                }, completion: { _ in
                    UIView.transition(with: self.warningMessage,
                                              duration: 0.3,
                                              options: [.transitionFlipFromTop, .curveEaseOut],
                                              animations: {
                                                self.warningMessage.isHidden = false
                    }, completion: nil)
                })
            })
        })
        
        
    }
}
