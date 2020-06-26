//
//  IncheonAirport.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class IncheonAirportViewController: UIViewController {
  
  // MARK: Properties
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Gas")
        imageView.contentMode = .scaleAspectFit
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
        let alert = UIAlertController(title: "Warning", message: "✖︎Covid19✖︎", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        present(alert, animated: true)
        alert.addAction(ok)
    }
    

    // MARK: Configure
    func configure() {
        alert()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        
    }
    
  
}

