//
//  ViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/10/26.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let toolsTitleArray = ["圆形调光", "KVO", "Coredata", "MVVM", "BlueTooth" ,"曲线图", "CircleSlider", "ConstraintToMargin", "UIPresentationController", "贝塞尔曲线", "设计模式"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tools"
        self.navigationController?.title = "Tools"
        
//        // 设置导航栏背景图片
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "horizontal.png"), for: .default)
//        // 取出分割线
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func manualAutoView() -> Void {
        let frame = CGRect(x: 0, y: 64, width: 150, height: 75)
        let manualAutoViews = ManualAutoSwitchView(frame: frame, manualTitle: "Manual", autoTitle: "Auto")
        
        self.view.addSubview(manualAutoViews)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toolsTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = toolsTitleArray[indexPath.row]
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController: UIViewController
        if indexPath.row == 0 {
            viewController = ColorCircleViewController(nibName: "ColorCircleViewController", bundle: nil)
        } else if indexPath.row == 1 {
            viewController = StockViewController(nibName: "StockViewController", bundle: nil)
        } else if indexPath.row == 2 {
            viewController = DataCoreExampleViewController(nibName: "DataCoreExampleViewController", bundle: nil)
        } else if indexPath.row == 3 {
            viewController = MvvmViewController(nibName: "MvvmViewController", bundle: nil)
        } else if indexPath.row == 4 {
            viewController = BlueToothViewController(nibName: "BlueToothViewController", bundle: nil)
        } else if indexPath.row == 5 {
            viewController = PlotViewController(nibName: "PlotViewController", bundle: nil)
        } else if indexPath.row == 6 {
            viewController = CircleSliderViewController(nibName: "CircleSliderViewController", bundle: nil)
        } else if indexPath.row == 7 {
            viewController = ConstraintToMarginViewController(nibName: "ConstraintToMarginViewController", bundle: nil)
        } else if indexPath.row == 8 {
            viewController = ModalViewController(nibName: "ModalViewController", bundle: nil)
        } else if indexPath.row == 9 {
            viewController = BezierPathViewController(nibName: "BezierPathViewController", bundle: nil)
        } else {
            let model = GPerson(firstName: "Tom", lastName: "Hanks")
            let greetingViewController = GreetingViewController(nibName: "GreetingViewController", bundle: nil)
            // let presenter = GreetingPresenter(view: greetingViewController, person: model)
            
            // greetingViewController.person = model
            // greetingViewController.presenter = presenter
            viewController = greetingViewController
        }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

