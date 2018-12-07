//
//  CustomClassFunction.swift
//  SwiftLearn
//
//  Created by huang zhengguo on 2018/12/7.
//  Copyright © 2018年 Inledco. All rights reserved.
//

func customClassFun() -> Void {
    var reference1: CustomPerson?
    var reference2: CustomPerson?
    var reference3: CustomPerson?
    
    reference1 = CustomPerson(name: "Tom")
    
    reference2 = reference1
    reference3 = reference1
    
    // 设置为nil的话会调用deInit
    reference1 = nil
    reference2 = nil
    
    // 知道最后一个强引用被调用的时候
    reference3 = nil
    
    // 类实例之间的强引用循环
    var john: CustomPerson?
    var unit4A: Apartment?
    
    john = CustomPerson(name: "John Appleseed")
    unit4A = Apartment(unit: "4A")
    
    john!.apartment = unit4A
    unit4A!.tenant = john
    
    john = nil
    unit4A = nil
    
    var tom: Customer?
    
    tom = Customer(name: "Tom")
    tom!.card = CreditCard(number: 1234_5678_9012_3456, customer: tom!)
    
    tom = nil
    
    var country = Country(name: "China", capitalName: "BeiJing")
    
    print("\(country.name)'s capital is called \(country.capitalCity.name)")
    
    let heading = HTMLElement(name: "h1")
    let defaultText = "This is default text."
    heading.asHtml = {
        return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
    }
    print(heading.asHtml())
    
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello world!")
    print(paragraph!.asHtml())
    
    paragraph = nil
    // 防止方法结束
    while true {
        
    }
}
