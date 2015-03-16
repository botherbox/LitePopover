//
//  ViewController.swift
//  LitePopover
//
//  Created by BotherBox on 15/3/15.
//  Copyright (c) 2015年 sz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var subView: UIView? = {
        let view = UIView(frame: CGRectMake(0, 0, 100, 100))
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
        return view
    }()
    
    var subSubView = UIView()
    
    var btn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
        btn.center = CGPointMake(150, 200)
        view.addSubview(btn)
        
        btn.addTarget(self, action: "demoPopover1:", forControlEvents: UIControlEvents.TouchUpInside)
        self.btn = btn
        
        subSubView.frame = CGRectMake(50, 50, 50, 50)
        subSubView.backgroundColor = UIColor.blueColor()
        subView?.addSubview(subSubView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func demoPopover1(fromView: UIButton) {
        
        let c = UIView(frame: CGRectMake(0, 0, 139, 178))
        c.backgroundColor = UIColor.greenColor()
        LitePopover.sharedLitePopover.present(content: c, fromView: btn!, popFinish: nil, dismiss: nil)
        
        // 显示一个Ctrl
//        let ctrl = TestMenuViewController()
//        LitePopover.sharedLitePopover.present(viewController: ctrl, fromRect: subSubView.bounds, inView: subSubView, popFinish: {
//                println("我全显示了")
//            }) {
//                println("我消失了")
//            }
    }

}

