//
//  File.swift
//  LitePopover
//
//  Created by BotherBox on 15/3/15.
//  Copyright (c) 2015年 sz. All rights reserved.
//

import UIKit

class LitePopover: NSObject {
    
    // 这里使用一个单例，是为了保持住这个实例以便能够dismiss的时候不会崩贵
    static let litePop = LitePopover()
    class var sharedLitePopover: LitePopover {
        return litePop
    }
    
    // 三角的边长
    let len: CGFloat = 30.0
    // 三角的边长的一半
    var halfLen: CGFloat {
        return self.len * 0.5
    }
    
    // 内边距
    let margin: CGFloat = 10.0
    // 动画时长
    let duration: Double = 0.25
    
    // 遮罩视图
    lazy private var cover: UIButton? = {
        let cover = UIButton(frame: UIScreen.mainScreen().bounds)
        cover.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        cover.alpha = 0.0
        return cover
    }()
    
    // 容器视图
    lazy private var container: ContainerView? = {
        let container = ContainerView.containerView(len: self.len, margin: self.margin)
        return container
    }()
    
    // 保持住传过来的ctrl
    private var ctrl: UIViewController?
    
    // 回调类型
    typealias Callback = ()->()
    // dismiss回调
    var dismiss: Callback?
    
    // 以inView里的fromRect为参照，弹出视图
    func present(content contentView: UIView, fromRect: CGRect, inView: UIView, popFinish:Callback?, dismiss:Callback?) {
        
        self.dismiss = dismiss
        
        let window = UIApplication.sharedApplication().windows.last as! UIWindow
        
        // 遮罩
        window.addSubview(cover!)
        cover?.alpha = 0.0 // 先隐藏
        cover!.addTarget(self, action: "dismissPopover", forControlEvents: UIControlEvents.TouchUpInside)
        
        // 计算容器尺寸 和 位置
        container!.bounds.size.width = contentView.bounds.size.width + 2 * margin
        container!.bounds.size.height = contentView.bounds.size.height + 2 * margin + halfLen
        
        container!.center.x = CGRectGetMidX(fromRect)
        container!.frame.origin.y = CGRectGetMaxY(fromRect)
        cover!.addSubview(container!)
        
        // 计算内容的位置
        contentView.frame.origin.x = margin
        contentView.frame.origin.y = margin + halfLen
        container!.addSubview(contentView)
        
        container!.center = inView.convertPoint(container!.center, toView: window)
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            cover?.alpha = 1.0 // 显示出来
        })
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.cover?.alpha = 1.0 // 显示出来
        }) { (finish) -> Void in
            // 完全显示之后，执行回调
            popFinish?()
        }
        
    }
    
    // 以fromView为参照，弹出一个视图
    func present(content contentView: UIView, fromView: UIView, popFinish:Callback?, dismiss:Callback?){
        present(content: contentView, fromRect: fromView.bounds, inView: fromView, popFinish: popFinish, dismiss: dismiss)
    }
    
    // 以fromView为参照，弹出一个controller
    func present(viewController ctrl: UIViewController, fromView: UIView,  popFinish:Callback?, dismiss:Callback?) {
        
//        present(content: ctrl.view, fromRect: fromView.bounds, inView: fromView)
        self.ctrl = ctrl
        present(content: ctrl.view, fromView: fromView, popFinish: popFinish, dismiss:dismiss)
    }
    
    // 以inView里的fromRect为参照，弹出控制器
    func present(viewController ctrl: UIViewController, fromRect: CGRect, inView: UIView, popFinish:Callback?, dismiss:Callback?) {
        self.ctrl = ctrl
        present(content: ctrl.view, fromRect: fromRect, inView: inView, popFinish: popFinish, dismiss: dismiss)
    }
    
    // 关闭弹出
    func dismissPopover() {
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.cover?.alpha = 0.0
        }) { (finish) -> Void in
            
            self.cover?.removeFromSuperview()
            self.container?.removeFromSuperview()
            self.ctrl = nil
            
            self.dismiss?()
        }
    }
    
}

/// 容器类
private class ContainerView: UIView {
    
    // 三角的边长
    var len: CGFloat = 0
    // 三角的边长的一半
    var halfLen: CGFloat {
        return len * 0.5
    }
    var margin: CGFloat = 0
    
    // 创建一个容器视图
    class func containerView(len: CGFloat = 30, margin: CGFloat = 10) -> ContainerView {
        var view = ContainerView()
        view.backgroundColor = UIColor.clearColor()
        view.len = len
        view.margin = margin
        return view
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // 画三角
        UIColor.lightGrayColor().set()
        
        let path = UIBezierPath()
        let halfW = bounds.size.width * 0.5
        path.moveToPoint(CGPointMake(halfW - halfLen, halfLen))
        path.addLineToPoint(CGPointMake(halfW + halfLen, halfLen))
        path.addLineToPoint(CGPointMake(halfW, 0))
        path.closePath()
        path.fill()
        
        // 画背景
        let bgW = bounds.width
        let bgH = bounds.height - halfLen
        let bgCornerR = margin
        let rectPath = UIBezierPath(roundedRect: CGRectMake(0, halfLen, bgW, bgH), cornerRadius: bgCornerR)
        rectPath.fill()
    }
    
}