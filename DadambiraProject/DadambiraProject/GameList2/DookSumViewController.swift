//
//  DookSum.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DookSumViewController: UIViewController {
    
    // MARK: Propertise
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "DookSumBG")
        return imageView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViewComponents()
    }
    
    // MARK: Helpers
    
    
    // MARK: Configure
    func configure() {
        
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}





