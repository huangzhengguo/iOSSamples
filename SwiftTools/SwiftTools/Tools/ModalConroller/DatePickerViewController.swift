//
//  DatePickerViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/5.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
        let local = NSLocale.init(localeIdentifier: "NL")
        
        self.datePicker.locale = local as Locale
        self.datePicker.datePickerMode = .countDownTimer
    }

    @IBAction func cancelBtnAction(_ sender: UIButton) {
        self .dismiss(animated: true, completion: nil)
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
