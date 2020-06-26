//
//  TelepathyChoiceCollectionCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyChoiceCollectionCell: UICollectionViewCell {
  // MARK: - Property
  
  let telepathyChoiceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 40)
    label.textColor = .white
    label.textAlignment = .center
    label.isHidden = true
    return label
  }()
  
  let telepathyChoiceDefaultLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 40)
    label.textColor = .white
    label.textAlignment = .center
    label.isHidden = false
    return label
  }()
  
  let margin: CGFloat = 30
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupContentLayout()
  }
  // MARK: - setup Layout
  func setupContentLayout() {
    [telepathyChoiceLabel, telepathyChoiceDefaultLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      
      telepathyChoiceLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      telepathyChoiceLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
      telepathyChoiceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      telepathyChoiceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
      
      telepathyChoiceDefaultLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      telepathyChoiceDefaultLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
      telepathyChoiceDefaultLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      telepathyChoiceDefaultLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
    ])
    
  }
}
