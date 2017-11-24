//
//  StockViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2017/11/14.
//  Copyright © 2017年 Huang. All rights reserved.
//

import UIKit

class StockViewController: UIViewController {
    let stockModel: StockModel! = StockModel()
    let myLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
    let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    var stockPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stockModel.setValue("searph", forKey: "stockName")
        stockModel.setValue(10.12, forKey: "stockPrice")
        stockModel.addObserver(self, forKeyPath: "stockPrice", options: [.new, .old], context: nil)
        
        myLabel.textColor = UIColor.red
        myLabel.text = stockModel.value(forKey: "stockPrice") as? String
        self.view.addSubview(myLabel)
        
        myButton.addTarget(self, action: #selector(myButtonAction(sender:)), for: .touchUpInside)
    }

    @objc func myButtonAction(sender: UIButton) -> Void {
        stockModel.setValue(stockPrice + 1, forKey: "stockPrice")
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
