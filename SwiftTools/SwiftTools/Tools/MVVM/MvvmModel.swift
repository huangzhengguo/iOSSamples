//
//  MvvmModel.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/2/1.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

class MvvmModel: NSObject {
    let person: Person
    let nameText: String?
    let birthdateText: String?
    
    init(person: Person) {
        self.person = person
        
        if person.salutation.count > 0 {
            self.nameText = String.init(format: "%@ %@ %@", self.person.salutation, self.person.firstName, self.person.lastName)
        } else {
            self.nameText = String.init(format: "%@ %@", self.person.firstName, self.person.lastName)
        }
        
        let dateFormate = DateFormatter.init()
        
        dateFormate.dateFormat = "EEEE MMMM d, yyyy"
        
        self.birthdateText = dateFormate.string(from: self.person.birthdate)
    }
}
