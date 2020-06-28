//
//  MainCollectionViewCell.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "CollectionCell"
  
  let mainImageView = UIImageView()
  let mainTitleImage = UIImageView()
  let titlteLable = UILabel()
  var isAnimated = false
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemnted")
  }
  
  override init(frame: CGRect){
    super.init(frame: frame)
    
    setupView()
    setupConstraints()
  }
  
  
  private func setupView(){
    mainImageView.clipsToBounds = true
    mainTitleImage.clipsToBounds = true
    
    // Shadow
//    let shadowPath2 = UIBezierPath(rect: bounds)
//    layer.masksToBounds = false
//    layer.shadowColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 0.5).cgColor
//    layer.shadowOffset = CGSize(width: CGFloat(2.0), height: CGFloat(3.0))
//    layer.shadowOpacity = 0.6
//    layer.shadowRadius = 4
//    layer.shadowPath = shadowPath2.cgPath
  }
  
  // Layout
  func setupConstraints() {
    [mainImageView,mainTitleImage,titlteLable].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    let contentViewWidth = contentView.frame.width
    let contetViewHeight = contentView.frame.height
    let contentMargin: CGFloat = 10
    
    NSLayoutConstraint.activate([
      mainImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      mainImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
      mainImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      mainTitleImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
      
      mainTitleImage.topAnchor.constraint(equalTo: mainImageView.safeAreaLayoutGuide.topAnchor),
      mainTitleImage.leadingAnchor.constraint(equalTo: mainImageView.safeAreaLayoutGuide.leadingAnchor),
      mainTitleImage.trailingAnchor.constraint(equalTo: mainImageView.safeAreaLayoutGuide.trailingAnchor),
      mainTitleImage.bottomAnchor.constraint(equalTo: mainImageView.safeAreaLayoutGuide.bottomAnchor),
      
      titlteLable.topAnchor.constraint(equalTo: mainImageView.safeAreaLayoutGuide.topAnchor, constant: contetViewHeight / 1.1),
      titlteLable.leadingAnchor.constraint(equalTo: mainTitleImage.leadingAnchor, constant: contentViewWidth / 4),
      titlteLable.trailingAnchor.constraint(equalTo: mainTitleImage.trailingAnchor, constant: -(contentViewWidth / 4)),
      titlteLable.bottomAnchor.constraint(equalTo: mainTitleImage.bottomAnchor, constant: -contentMargin),
    ])
    mainImageView.contentMode = .scaleAspectFill
    mainTitleImage.contentMode = .scaleAspectFill
    titlteLable.textAlignment = .center
    titlteLable.textColor = UIColor(red: 244/255, green: 238/255, blue: 255/255, alpha: 1)
  }
  
  func configure(image: UIImage?, title: String){
    mainImageView.image = image
    mainTitleImage.image = image
    titlteLable.text = title
  }
}


