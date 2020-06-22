//
//  TimeBombViewController.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TimeBombViewController: UIViewController {
    // MARK: Properties
    
    
    lazy var choiceTime: UILabel = {
       let choiceTime = UILabel()
        choiceTime.textColor = .white
        return choiceTime
    }()
    
    lazy var pickerTimeView: PickerTimeView = {
        let pickerTimeView = PickerTimeView()
        return pickerTimeView
    }()
    
    lazy var gameStratButton: UIButton = {
        let gameStratButton = UIButton()
        gameStratButton.setTitle("레쓰 기릿", for: .normal)
        gameStratButton.setTitleColor(UIColor.white, for: .normal)
        gameStratButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return gameStratButton
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViewComponents()
    }
    
    // MARK: Configure
    func configure() {
        
        
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(choiceTime)
        choiceTime.translatesAutoresizingMaskIntoConstraints = false
        choiceTime.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        choiceTime.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(gameStratButton)
        gameStratButton.translatesAutoresizingMaskIntoConstraints = false
        gameStratButton.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 600).isActive = true
        gameStratButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(pickerTimeView)
        pickerTimeView.translatesAutoresizingMaskIntoConstraints = false
        pickerTimeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pickerTimeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pickerTimeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        pickerTimeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    // MARK: @Objc
    @objc func didTapButton() {
        
    }
}

extension UIView {
  var parentViewController: UIViewController? {
    var responder: UIResponder? = self
    while let nextResponder = responder?.next {
      responder = nextResponder
      if let vc = nextResponder as? UIViewController {
        return vc
      }
    }
    return nil
  }
}
