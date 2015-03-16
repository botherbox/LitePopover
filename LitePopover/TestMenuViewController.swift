//
//  TestMenuViewController.swift
//  LitePopover
//
//  Created by BotherBox on 15/3/16.
//  Copyright (c) 2015年 sz. All rights reserved.
//

import UIKit

@objc (TestMenuViewController) class TestMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(sender: UIButton) {
        
        println("你好")
    }
    
    deinit {
        println("我走了")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
