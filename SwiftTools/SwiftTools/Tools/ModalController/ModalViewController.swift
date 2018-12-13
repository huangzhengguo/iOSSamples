//
//  ModalViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/4.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController,UIViewControllerTransitioningDelegate {
    var datePickerViewController: DatePickerViewController?
    var customPresentationController: CustomPresentationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        datePickerViewController = DatePickerViewController(nibName: "DatePickerViewController", bundle: nil)
        
        // 自定义PresentationController的两个条件
        // 1.设置ViewController的style
        // 2.设置一个transition代理
        datePickerViewController?.modalPresentationStyle = .custom
        datePickerViewController?.transitioningDelegate = self
    }

    @IBAction func showPresentationController(_ sender: UIButton) {
        self.present((datePickerViewController)!, animated: true, completion: nil)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let customPresentationController = CustomPresentationController.init(presentedViewController: datePickerViewController!, presenting: self)

        return customPresentationController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
