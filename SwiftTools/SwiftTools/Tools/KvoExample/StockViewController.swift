//
//  StockViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit

class StockViewController: UIViewController {
    var stockModel: StockModel!
    let myLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
    let myButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2.0 - 50, y: 300, width: 100, height: 30))
    var stockOb: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myButton.setTitle("增加", for: .normal)
        myButton.backgroundColor = UIColor.gray
        myButton.addTarget(self, action: #selector(myButtonAction), for: .touchUpInside)
        
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton)
        
        // Do any additional setup after loading the view.
        stockModel = StockModel(stockName: "searph", stockPrice: 10.12)
        
        myLabel.text = String.init(stockModel.stockPrice)
        // 键值观察者模式，监听模型属性值变化
        stockOb = stockModel.observe(\ StockModel.stockPrice) { (s, value) in
            self.myLabel.text = String.init(describing: s.stockPrice)
        }
    }

    @objc func myButtonAction(sender: UIButton) -> Void {
        stockModel.stockPrice = stockModel.stockPrice + 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
