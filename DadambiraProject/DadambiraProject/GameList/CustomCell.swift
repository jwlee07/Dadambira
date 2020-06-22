//
//  CustomCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
  
  let customImageView = UIImageView()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImageView()
  }
  private func setupImageView() {
    contentView.addSubview(customImageView)
    customImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    customImageView.contentMode = .scaleAspectFit
    clipsToBounds = true
  }
}
