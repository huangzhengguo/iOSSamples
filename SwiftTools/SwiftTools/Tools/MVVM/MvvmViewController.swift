//
//  MvvmViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/2/1.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class MvvmViewController: UIViewController {
    var person: Person?
    var mvvmModel: MvvmModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        person = Person()
        
        person?.salutation = "salutation"
        person?.firstName = "firstName"
        person?.lastName = "lastName"
        person?.birthdate = Date.init()
        
        mvvmModel = MvvmModel(person: person!)
        
        self.title = mvvmModel?.birthdateText
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
