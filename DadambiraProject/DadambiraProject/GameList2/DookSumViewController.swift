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
    let copImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Cop")
        return imageView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViewComponents()
    }
    
    // MARK: Helpers
    func alert() {
        let alert = UIAlertController(title: "철컹", message: "🚨이곳은 낚시 금지구역입니다🚨", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        present(alert, animated: true)
        alert.addAction(ok)
    }
    
    // MARK: Configure
    func configure() {
        alert()
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(copImageView)
        copImageView.translatesAutoresizingMaskIntoConstraints = false
        copImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        copImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        copImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        copImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}





