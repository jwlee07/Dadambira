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
    
    gameImage.clipsToBounds = true
    gameTitle.clipsToBounds = true
    gameLable.clipsToBounds = true
    
    //게임이미지
    gameImage.contentMode = .scaleAspectFill
    contentView.addSubview(gameImage)
    
    //게임이름
    gameTitle.contentMode = .center
    contentView.addSubview(gameTitle)
    
    //게임설명
    gameLable.contentMode = .left
    contentView.addSubview(gameLable)
    
 }
  
  func startAnimation(){
    
  }
  
  
  
  func configure(image: UIImage?, title: String, lable: String){
    gameImage.image = image
    gameTitle.text = title
    gameLable.text = lable
    
  }
  

  
  }




