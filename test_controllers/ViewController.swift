//
//  ViewController.swift
//  test_controllers
//
//  Created by Denys Astapov on 20.10.2023.
//

import UIKit

enum NavigationType {
    case present, push
}

class ViewController: UIViewController {

    class BeautyButton: UIButton {
        
        init(title: String, titleColor: UIColor, backgroundColor: UIColor) {
            super.init(frame: .zero)
            self.setTitle(title, for: .normal)
            self.setTitleColor(titleColor, for: .normal)
            self.backgroundColor = backgroundColor
            self.layer.cornerRadius = 10
            self.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: 150),
                self.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    init(navigationType: NavigationType? = nil){
        self.navigationType = navigationType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let navigationType: NavigationType?
    private let newPresentBtn = BeautyButton(title: "New Present", titleColor: .white, backgroundColor: .black)
    private let presentBtn = BeautyButton(title: "Present", titleColor: .white, backgroundColor: .systemPink)
    private let pushBtn = BeautyButton(title: "Push", titleColor: .white, backgroundColor: .systemBlue)
    private let goBackBtn = BeautyButton(title: "Go back 🔙", titleColor: .black, backgroundColor: .systemYellow)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main View Controller"
        self.view.backgroundColor = .systemBackground
        
        setUpStackView()
        
        setUpPresentBtn()
        setUpPushBtn()
        setUpGoBackBtn()
        
        goBackBtn.isHidden = navigationType == nil
    }
    
    private func setUpPresentBtn() {
        presentBtn.addAction(.init(handler: { [unowned self] _ in
            let navModalViewController = UINavigationController(rootViewController: ViewController(navigationType: .present))
            present(navModalViewController, animated: true)
        }), for: .touchUpInside)
        self.view.addSubview(presentBtn)
        
        NSLayoutConstraint.activate([
            presentBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)
        ])
    }
    
    private func setUpPushBtn() {
        pushBtn.addAction(.init(handler: { [unowned self] _ in
            let testViewController = ViewController(navigationType: .push)
            self.navigationController?.pushViewController(testViewController, animated: true)
        }), for: .touchUpInside)
        self.view.addSubview(pushBtn)
        
        NSLayoutConstraint.activate([
            pushBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushBtn.topAnchor.constraint(equalTo: presentBtn.bottomAnchor, constant: 50)
        ])
    }
    
    private func setUpGoBackBtn() {
        goBackBtn.isHidden = true
        goBackBtn.addAction(.init(handler: { [unowned self] _ in
            switch navigationType {
            case .present:
                dismiss(animated: true)
            case .push:
                navigationController?.popViewController(animated: true)
            case nil:
                return
            }
        }), for: .touchUpInside)
        self.view.addSubview(goBackBtn)
        
        NSLayoutConstraint.activate([
            goBackBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackBtn.topAnchor.constraint(equalTo: pushBtn.bottomAnchor, constant: 50)
        ])
    }
    
    private func setUpStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(presentBtn)
        stackView.addArrangedSubview(pushBtn)
        stackView.addArrangedSubview(goBackBtn)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
    }
    
}


