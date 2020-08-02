//
//  StartTableViewCell.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class StartTableViewCell: UITableViewCell {
  
  let identfire = "TableCell"
  
  let gameImage = UIImageView()
  let gameTitle = UILabel()
  let gameLable = UILabel()
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func setupCell() {
    
    let margin: CGFloat = 10
    let contentViewWidth = contentView.frame.width
    let contentViewHeight = contentView.frame.height
    self.selectionStyle = .none
    
    [gameImage, gameTitle, gameLable].forEach {
      $0.clipsToBounds = true
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      gameImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: margin),
      gameImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: margin),
      gameImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -(contentViewWidth / 1.25)),
      gameImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
      
      gameTitle.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: margin),
      gameTitle.leadingAnchor.constraint(equalTo: gameImage.safeAreaLayoutGuide.trailingAnchor, constant: margin),
      gameTitle.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
      gameTitle.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -(contentViewHeight * 2.4)),
      
      gameLable.topAnchor.constraint(equalTo: gameTitle.safeAreaLayoutGuide.bottomAnchor),
      gameLable.leadingAnchor.constraint(equalTo: gameImage.safeAreaLayoutGuide.trailingAnchor, constant: margin),
      gameLable.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
      gameLable.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -margin)
    ])
    
    // gameImage
    gameImage.contentMode = .scaleToFill
    gameImage.layer.cornerRadius = 15

    // gameTitle
    gameTitle.contentMode = .top
    gameTitle.textColor = .white
    gameTitle.font = UIFont.boldSystemFont(ofSize: 15)
    gameTitle.backgroundColor = .clear

    
    // gameLable
    gameLable.contentMode = .left
    gameLable.lineBreakMode = .byClipping
    gameLable.numberOfLines = 5
    gameLable.textColor = .white
    gameLable.font = UIFont.systemFont(ofSize: 15, weight: .light)
    gameLable.backgroundColor = .clear

  }
  
  func configure(image: UIImage?, title: String, lable: String){
    gameImage.image = image
    gameTitle.text = title
    gameLable.text = lable
  }
}




