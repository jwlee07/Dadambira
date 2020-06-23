//
//  CustomCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyCell: UITableViewCell {
  
  let telepathCellImage: [UIImage] = ["1.circle", "2.circle", "3.circle" ,"4.circle" ,"5.circle"].compactMap(UIImage.init(systemName:))
  
  let telepathCellTextfield: UITextField = {
    let textfield = UITextField()
    textfield.font = UIFont.boldSystemFont(ofSize: 10)
    textfield.layer.cornerRadius = 5
    textfield.textAlignment = .left
    textfield.clipsToBounds = true
    textfield.borderStyle = .roundedRect
    return textfield
  }()
  
  let telepathCellButton: UIButton = {
    let button = UIButton()
    button.setTitle("입력완료", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    button.layer.cornerRadius = 5
    button.clipsToBounds = true
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  func setupContentViewLayout() {
    
  }
}


