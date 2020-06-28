//
//  ViewController.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: - Property
  
  let identifire = "MainViewController"
  var push = true
  var selectIndexPathArray: IndexPath = []
  
  let collectionMargin: CGFloat = 75
  let titleMargin: CGFloat = 15
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "게임목록"
    label.textAlignment = .center
    label.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()
  
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layour)
  let layour = UICollectionViewFlowLayout()
  
  // MARK: -  LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationClear()
    setupCollectionView()
  }
  
  // MARK: - Setup Layout
  
  func navigationClear(){
    
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 66/255, green: 72/255, blue: 116/255)]
  }

  func setupCollectionView() {
    let viewWidth = view.frame.width
    let viewHeight = view.frame.height
    let lineSpacingMargin: CGFloat = 15
    let interItemSpacingMargin: CGFloat = 0
    let InsetMargin: CGFloat = 15
    
    
    [collectionView, titleLabel].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    layour.itemSize = CGSize(width: viewWidth / 2.3  , height: viewHeight / 3)
    layour.minimumLineSpacing = lineSpacingMargin
    layour.minimumInteritemSpacing = interItemSpacingMargin
    layour.sectionInset = UIEdgeInsets(top: InsetMargin, left: InsetMargin, bottom: InsetMargin, right: InsetMargin)
    
    // CollectionView
    // 220, 214, 247
    super.view.backgroundColor = UIColor(red: 220/255, green: 214/255, blue: 247/255, alpha: 1)
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
    
    
    // Layout
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: titleMargin),
      titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: viewWidth / 3),
      titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -viewWidth / 3),
      
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  collectionMargin),
      collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}


// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    images.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MainCollectionViewCell
    if !cell.isAnimated {
      UIView.animate(
        withDuration: 0.5,
        delay: 0.5 * Double(indexPath.row),
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0.5,
        options: indexPath.row % 2 == 0 ? .transitionFlipFromLeft : .transitionFlipFromRight,
        animations: {
        if indexPath.row % 2 == 0 {
          AnimationUtility.viewSlideInFromLeft(toRight: cell)
        }
        else {
          AnimationUtility.viewSlideInFromRight(toLeft: cell)
        }
      }, completion: { (done) in
        cell.isAnimated = true
      })
    }
    cell.backgroundColor = .clear
    cell.mainImageView.image = UIImage(named: images[indexPath.item])
    cell.mainImageView.contentMode = .scaleToFill
    cell.mainTitleImage.image = UIImage(named: "cardShadow")?.withTintColor(UIColor(red: 32/255, green: 32/255, blue: 96/255, alpha: 0.7))
    cell.titlteLable.text = titleData[indexPath.item]
    cell.tintColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1)
    cell.layer.cornerRadius = 15
    cell.layer.shadowRadius = 15
    cell.clipsToBounds = true
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    guard sourceIndexPath != destinationIndexPath else { return }
    let source = sourceIndexPath.item
    let destination = destinationIndexPath.item
    print("source: ", source, "dest: ", destination)
  }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectIndexPathArray.append(indexPath)
    
    switch titleData[indexPath.item] {
    case "텔레파시" :
      let HitAndMissGameVC = HitAndMissGameViewController()
      HitAndMissGameVC.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(HitAndMissGameVC, animated: true)
      
    case "복불복" :
      let TelepathyInfoGameVC = TelepathyInfoGameViewController()
      TelepathyInfoGameVC.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(TelepathyInfoGameVC, animated: true)
      
      
    case "받아라 폭탄" :
      let TimeBombVC = TimeBombViewController()
      TimeBombVC.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(TimeBombVC, animated: true)
      
    case "낚시게임" :
      let LetsFishingVC = LetsFishingViewController()
      LetsFishingVC.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(LetsFishingVC, animated: true)
      
    default:
      print("잘못된 접근")
    }
    
  }
}
