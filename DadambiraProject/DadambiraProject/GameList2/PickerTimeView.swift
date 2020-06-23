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
    
    var checkBool = false
    
    private var pickerView: PickerView = {
        let pickerView = PickerView()
        return pickerView
    }()
    
    private var nextButton: UIButton = {
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
    private func configure() {
        
    }
    
    // MARK: Configure View Components
    private func configureViewComponents() {
//        backgroundColor = UIColor(rgb: 0x484c7f)
        transform = CGAffineTransform.identity
        
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: topAnchor, constant: 600).isActive = true
        
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
    // MARK: @Objc
    @objc func didTapButton() {
        if checkBool == false {
            checkBool = true
        UIView.animate(withDuration: 1.7, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: -50, y: -50)
        })
        }else {
            checkBool = false
            UIView.animate(withDuration: 1.7, animations: {
                self.alpha = 1
                self.transform = CGAffineTransform.identity
                print("?")
            })
        }
    }
}
