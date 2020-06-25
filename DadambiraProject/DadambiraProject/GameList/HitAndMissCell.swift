//
//  HitAndMissCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HitAndMissCell: UICollectionViewCell {
  
  let customImageView = UIImageView()
  let custimMiniImageView = UIImageView()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImageView()
  }
  private func setupImageView() {
    let imageViewArr: [UIImageView] = [customImageView, custimMiniImageView]
    for indexImageView in imageViewArr {
      contentView.addSubview(indexImageView)
      indexImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      customImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      customImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
      customImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      customImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
    ])
    customImageView.contentMode = .scaleAspectFit
    clipsToBounds = true
    
    NSLayoutConstraint.activate([
      custimMiniImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: -contentView.frame.width / 1.4),
      custimMiniImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: contentView.frame.width / 1.5),
      custimMiniImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      custimMiniImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
    ])
    custimMiniImageView.contentMode = .scaleAspectFit
    clipsToBounds = true
    
    UIView.animate(withDuration: 0.5, delay: 0, options: .repeat, animations: {
      self.custimMiniImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    })
  }
}
