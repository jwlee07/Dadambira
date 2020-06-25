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

  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemnted")
    
  }
  
  override init(frame: CGRect){
    super.init(frame: frame)
    
    setupView()
    setupConstraints()
    mainAnimation()
  }
  
  
  private func setupView(){
    mainImageView.clipsToBounds = true
    mainTitleImage.clipsToBounds = true
    // layer.cornerRadius = 10
    
    
    //쉐도우
    let shadowPath2 = UIBezierPath(rect: bounds)
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: CGFloat(2.0), height: CGFloat(3.0))
    layer.shadowOpacity = 0.6
    layer.shadowRadius = 4
    layer.shadowPath = shadowPath2.cgPath
    
    
    
    //메인이미지
    mainImageView.contentMode = .scaleAspectFill
    contentView.addSubview(mainImageView)
    //메인타이틀 이미지
    mainTitleImage.contentMode = .scaleAspectFill
    contentView.addSubview(mainTitleImage)
    
    //타이틀레이블
    //244, 238, 255
    titlteLable.textAlignment = .left
    titlteLable.textColor = UIColor(red: 244/255, green: 238/255, blue: 255/255, alpha: 1)
    // titlteLable.font = .preferredFont(forTextStlye: .headline)
    contentView.addSubview(titlteLable)
    
    
  }
  
  //레이아웃
  func setupConstraints() {
    [mainImageView,mainTitleImage,titlteLable].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    mainTitleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    
    mainTitleImage.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 120).isActive = true
    mainTitleImage.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor).isActive = true
    mainTitleImage.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor).isActive = true
    mainTitleImage.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor).isActive = true
    
    
    titlteLable.topAnchor.constraint(equalTo: mainTitleImage.topAnchor, constant: 130).isActive = true
    titlteLable.leadingAnchor.constraint(equalTo: mainTitleImage.leadingAnchor).isActive = true
    titlteLable.trailingAnchor.constraint(equalTo: mainTitleImage.trailingAnchor).isActive = true
    titlteLable.bottomAnchor.constraint(equalTo: mainTitleImage.bottomAnchor).isActive = true

    
  }
  
  func mainAnimation(){
      UIView.animateKeyframes(
        withDuration: 1,
        delay: 0,
        animations: {
          UIView.addKeyframe(withRelativeStartTime: 0.0,
                             relativeDuration: 0.25
          ){
       // self.contentView.alpha = 10
           self.titlteLable.center.x += 50.0
        //   self.titlteLable.center.y += 20.0
          }
      }

      ){ _ in
      }
  }
  

  
  func configure(image: UIImage?, title: String){
    mainImageView.image = image
    mainTitleImage.image = image
    titlteLable.text = title
  }
  
}


