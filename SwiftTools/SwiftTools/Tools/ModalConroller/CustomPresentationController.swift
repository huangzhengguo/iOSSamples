//
//  CustomPresentationController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/4.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    var dimmingView: UIView?
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        self.dimmingView = UIView.init()
        self.dimmingView?.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.dimmingView?.alpha = 0.0
    }
    
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView
        // 设置背景透明度
        // containerView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        
        let presentedViewController = self.presentedViewController
        
        self.dimmingView?.frame = (containerView?.bounds)!
        self.dimmingView?.alpha = 0.0
        
        containerView?.insertSubview(self.dimmingView!, at: 0)
        
        if (presentedViewController.transitionCoordinator != nil) {
            presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
                self.dimmingView?.alpha = 1.0
            }, completion: nil)
        } else {
            self.dimmingView?.alpha = 1.0
        }
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            self.dimmingView!.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if self.presentedViewController.transitionCoordinator != nil {
            self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
                self.dimmingView?.alpha = 0.0
            }, completion: nil)
        } else {
            self.dimmingView?.alpha = 0.0
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.dimmingView?.removeFromSuperview()
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let containerBounds = self.containerView?.bounds
        let presentedViewFrame = CGRect.init(x: (containerBounds?.size.width)! / 2.0 - 150, y: (containerBounds?.size.height)! / 2 - 200, width: 300.0, height: 330.0)
        
        return presentedViewFrame
    }
}
