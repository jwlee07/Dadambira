//
//  PickerView.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PickerTimeView: UIView {
    
    
    // MARK: Properties
    lazy var pickerView: PickerView = {
        let pickerView = PickerView()
        return pickerView
    }()
    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return nextButton
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Configure
    func configure() {
        
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        backgroundColor = .systemBackground
        transform = CGAffineTransform.identity
        
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: topAnchor, constant: 700).isActive = true
        
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
    // MARK: @Objc
    @objc func didTapButton() {
        UIView.animate(withDuration: 1.7, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: -50, y: -50)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}
