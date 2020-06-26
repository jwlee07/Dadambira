//
//  HitAndMissCustomView.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HitAndMissCustomView: UIViewController {
  // MARK: - Property
  let alertImageView = UIImageView()
  var alertImage = UIImage()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
  }
  // MARK: - setup Layout
  func setupLayout() {
    alertImageView.frame = CGRect(x:0, y:-5, width: 75 ,height: 75)
    self.view.addSubview(alertImageView)
    self.preferredContentSize = CGSize(width:75,height:85)
  }
}
