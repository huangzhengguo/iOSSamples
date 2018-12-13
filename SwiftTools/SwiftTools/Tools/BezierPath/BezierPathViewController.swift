//
//  BezierPathViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/13.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class BezierPathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 防止导航栏遮住添加的子视图
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        self.navigationController?.navigationBar.isTranslucent = false
        let bpView = BpView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))

        bpView.backgroundColor = UIColor.gray
        self.view.addSubview(bpView)
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
