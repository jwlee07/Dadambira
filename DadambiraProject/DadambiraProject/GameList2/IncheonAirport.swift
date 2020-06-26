//
//  IncheonAirport.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class IncheonAirportViewController: UIViewController {
  
  let label: UILabel = {
    let label = UILabel()
    label.text = "IncheonAirport"
    label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
    view.addSubview(label)
  }
  
}

