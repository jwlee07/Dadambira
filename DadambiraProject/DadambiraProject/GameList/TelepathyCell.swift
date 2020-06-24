//
//  CustomCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyCell: UITableViewCell {
  
  // MARK: - ProPerty
  
  let telepathCellTextfield: UITextField = {
    let textfield = UITextField()
    textfield.backgroundColor = .systemBlue
    textfield.placeholder = "입력"
    textfield.font = UIFont.boldSystemFont(ofSize: 30)
    textfield.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
    textfield.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    textfield.textAlignment = .left
    textfield.clipsToBounds = true
    textfield.borderStyle = .none
    return textfield
  }()
  
  let leadingMargin: CGFloat = 75
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupContentViewLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  // MARK: -  setup Layout
  
  func setupContentViewLayout() {
    contentView.addSubview(telepathCellTextfield)
    telepathCellTextfield.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      telepathCellTextfield.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      telepathCellTextfield.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: leadingMargin),
      telepathCellTextfield.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      telepathCellTextfield.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}


