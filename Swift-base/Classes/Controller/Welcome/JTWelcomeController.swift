//
//  JTWelcomeController.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/24.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit
import SnapKit

class JTWelcomeController: UIViewController {

    var welcomeView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        
        setupUI()
    }
    
    deinit {
        
        HDLog.LogClassDestory("WelcomeController")
    }
    
    // MARK: - 创建UI视图
    func setupUI() {
        
        welcomeView = UIScrollView()
        welcomeView?.backgroundColor = UIColor.white
        welcomeView?.contentSize = CGSize(width: Constants.HDSCREENWITH * 5, height: Constants.HDSCREENHEIGHT)
        welcomeView?.isPagingEnabled = true
        welcomeView?.bounces = false
        welcomeView?.showsHorizontalScrollIndicator = false
        welcomeView?.showsVerticalScrollIndicator = false
        self.view.addSubview(welcomeView!)
        
        unowned let WS = self;
        welcomeView?.snp.makeConstraints( { (make) -> Void in
            
            make.top.equalTo(WS.view).offset(0)
            make.left.equalTo(WS.view).offset(0)
            make.bottom.equalTo(WS.view).offset(0)
            make.width.equalTo(Constants.HDSCREENWITH)
            
        })
        
        
        for i in 1...5 {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: String(format: "guide_step%d", i))
            welcomeView?.addSubview(imageView)
            imageView.snp.makeConstraints( { (make) -> Void in
                
                make.top.equalTo(welcomeView!).offset(0)
                make.left.equalTo(welcomeView!).offset(CGFloat(i - 1) * Constants.HDSCREENWITH)
                make.width.equalTo(Constants.HDSCREENWITH)
                make.height.equalTo(Constants.HDSCREENHEIGHT)
            })
            
            if i == 5 {
                
                let btn = UIButton(type: UIButtonType.custom)
                btn.backgroundColor = UIColor.clear
                btn.setTitle("立即体验", for: UIControlState())
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = true
                btn.setTitleColor(Constants.HDYellowColor, for: UIControlState.normal)
                btn.layer.borderColor = Constants.HDMainColor.cgColor
                btn.layer.borderWidth = 1
                welcomeView?.addSubview(btn)
                
                btn.addTarget(self, action: #selector(toMain), for: UIControlEvents.touchUpInside)
                
                btn.snp.makeConstraints( { (make) -> Void in
                    
                    make.bottom.equalTo(welcomeView!).offset(Constants.HDSCREENHEIGHT - 100)
                    make.left.equalTo(welcomeView!).offset(CGFloat(i - 1) * Constants.HDSCREENWITH + Constants.HDSCREENWITH / 2 - 50)
                    make.width.equalTo(100)
                    make.height.equalTo(30)
                    
                })
                
            }
            
        }
        
    }
    
    // MARK: - events
    
    @objc func toMain() {
        
        /**
         *  欢迎界面只展示一次
         */
        //        let userDefault = NSUserDefaults.standardUserDefaults()
        //        userDefault.setValue(Constants.HDShowWelcome, forKey: Constants.HDShowWelcome)
        //        userDefault.synchronize()
        
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        UIApplication.shared.delegate?.window!!.rootViewController = JTMainViewController()
        
    }

    

}
