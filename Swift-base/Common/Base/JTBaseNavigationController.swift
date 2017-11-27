//
//  JTBaseNavigationController.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/22.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

class JTBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        let attributes = [
            NSAttributedStringKey.foregroundColor : UIColor.hexInt(0x333333),
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = UIColor.hexInt(0x333333)
        
        
//        let img = UIImage(named: "btn_back_n")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 18, 0, 0))
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-1000, 0), for: .default)    // 让导航条返回键带的title消失!
//        UIBarButtonItem.appearance().setBackButtonBackgroundImage(img, for: .normal, barMetrics: .default)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
           let item = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_back_n").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(JTBaseNavigationController.pop))
            
            viewController.navigationItem.leftBarButtonItem = item
            self.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func pop() -> Void {
        self.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
