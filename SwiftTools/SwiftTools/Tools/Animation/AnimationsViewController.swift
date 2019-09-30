//
//  AnimationsViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2019/4/25.
//  Copyright © 2019 Huang. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    let redView: UIView! = UIView.init(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
    let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    var count: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 点击button改变当前视图动画
        // self.addChangeViewBtn()
    }

    private func addChangeViewBtn() {
        let btn = UIButton.init(type: UIButton.ButtonType.roundedRect)
        
        btn.setTitle("改变", for: .normal)
        btn.frame = CGRect(x: 10, y: 80, width: 60, height: 40)
        
        btn.addTarget(self, action: #selector(changeUIView(btn:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
        self.redView.backgroundColor = UIColor.red
        
        label.text = "测试"
        
        self.redView.addSubview(label)
        
        self.view.addSubview(self.redView)
    }
    
    @objc private func changeUIView(btn: UIButton) -> Void {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.5)
//        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.curlUp, for: self.redView, cache: true)
        UIView.commitAnimations()
        
        count = count + 1
        label.text = String.init(format: "第二个测试标题%ld", count)
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
