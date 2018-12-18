//
//  GreetingViewController.swift
//  SwiftTools
//
//  Created by huang zhengguo on 2018/12/17.
//  Copyright © 2018年 Huang. All rights reserved.
//

import UIKit

struct GPerson {
    let firstName: String
    let lastName: String
}

protocol GreetingView: class {
    func setGreeting(greeting: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: GPerson)
    func showGreeting()
}

class GreetingPresenter: GreetingViewPresenter {
    unowned let view: GreetingView
    let person: GPerson
    required init(view: GreetingView, person: GPerson) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello," + person.firstName + " " + person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}

protocol GreetingViewModelProtocol: class {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
    init(person: GPerson)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    let person:GPerson
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    required init(person: GPerson) {
        self.person = person
    }
    
    func showGreeting() {
        self.greeting = "Hello," + person.firstName + " " + person.lastName
    }
}

class GreetingViewController: UIViewController {
    // var person: GPerson! MVC
    // var presenter: GreetingViewPresenter!
    @IBOutlet weak var showGreetingButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = {
                [unowned self] viewModel in
                    self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // self.showGreetingButton.addTarget(self.viewModel, action: "showGreeting", for: .touchUpInside)
        
    }

    @objc func didTapButton(button: UIButton) -> Void {
//        let greeting = "Hello," + person.firstName + " " + person.lastName
//        self.greetingLabel.text = greeting
//        self.presenter.showGreeting()
    }

//    func setGreeting(greeting: String) -> Void {
//        self.greetingLabel.text = greeting
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
