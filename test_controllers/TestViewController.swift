//
//  TestViewController.swift
//  test_controllers
//
//  Created by Denys Astapov on 21.10.2023.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.title = "Test View Controller"
//        if navigationController?.viewControllers.isEmpty == false {
//            let back_btn = UIButton(frame: CGRect(x: view.bounds.width / 2 - 75, y: view.bounds.height / 3, width: 150, height: 50))
//            back_btn.setTitle("Back", for: .normal)
//            back_btn.setTitleColor(.black, for: .normal)
//            back_btn.layer.cornerRadius = 10
//            back_btn.backgroundColor = .systemYellow
//            back_btn.addAction(.init(handler: { _ in
//                self.navigationController?.popViewController(animated: true)
//            }), for: .touchUpInside)
//            self.view.addSubview(back_btn)
//        }
        if parent != nil || navigationController?.viewControllers.isEmpty == false {
            let goBackBtn = UIButton()
            goBackBtn.setTitle("Go back 🔙", for: .normal)
            goBackBtn.setTitleColor(.black, for: .normal)
            goBackBtn.layer.cornerRadius = 10
            goBackBtn.backgroundColor = .systemYellow
            goBackBtn.addAction(.init(handler: { _ in
                self.dismiss(animated: true)
                self.navigationController?.popViewController(animated: true)
            }), for: .touchUpInside)
            goBackBtn.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(goBackBtn)
            
            let goBackBtnHorizontalConstraint = NSLayoutConstraint(item: goBackBtn, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
            let goBackBtnVerticalConstraint = NSLayoutConstraint(item: goBackBtn, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 400)
            let goBackBtnWidthConstraint = NSLayoutConstraint(item: goBackBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150)
            let goBackBtnHeightConstraint = NSLayoutConstraint(item: goBackBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
            let goBackBtnConstraints = [goBackBtnHorizontalConstraint, goBackBtnVerticalConstraint, goBackBtnWidthConstraint, goBackBtnHeightConstraint]
            NSLayoutConstraint.activate(goBackBtnConstraints)
        }
    }
}
