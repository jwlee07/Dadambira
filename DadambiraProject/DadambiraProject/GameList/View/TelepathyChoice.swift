//
//  TelepathyChoice.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyChoiceViewController: UIViewController {
  
  // MARK: - Property
  let telepathyChoicecollectionViewLayout = UICollectionViewFlowLayout()
  lazy var telepathyChoicecollectionView = UICollectionView (frame: view.frame, collectionViewLayout: telepathyChoicecollectionViewLayout)
  
  let insetMargin: CGFloat = 20
  let LineSpacing: CGFloat = 10
  let SpacingMargin: CGFloat = 20
  let widthPadding: CGFloat = 15
  
  var randomTexList: [String] = []
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "복볼복"
    setupView()
    setupNavigationBar()
  }
  // MARK: - setup Layout
  
  func setupView() {
    
    telepathyChoicecollectionViewLayout.itemSize = CGSize (width: view.frame.width - (widthPadding * 2), height: view.frame.height / 7)
    telepathyChoicecollectionViewLayout.minimumLineSpacing = LineSpacing
    telepathyChoicecollectionViewLayout.minimumInteritemSpacing = SpacingMargin
    telepathyChoicecollectionViewLayout.sectionInset = UIEdgeInsets(top: insetMargin, left: insetMargin, bottom: insetMargin, right: insetMargin)
    
    view.addSubview(telepathyChoicecollectionView)
    telepathyChoicecollectionView.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
    telepathyChoicecollectionView.dataSource = self
    telepathyChoicecollectionView.delegate = self
    telepathyChoicecollectionView.register(TelepathyChoiceCollectionCell.self, forCellWithReuseIdentifier: "ChoiceCustom")
        
    randomTexList = textList.shuffled()
  }
  
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  @objc func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popToRootViewController(animated: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.telepathyChoicecollectionView.reloadData()
      textList.removeAll()
      self.randomTexList.removeAll()
    }
  }
}
// MARK: - UICollectionViewDataSource
extension TelepathyChoiceViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    textList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let telepathyChoicecollectionCell = telepathyChoicecollectionView.dequeueReusableCell(withReuseIdentifier: "ChoiceCustom", for: indexPath) as! TelepathyChoiceCollectionCell
    telepathyChoicecollectionCell.telepathyChoiceLabel.text = randomTexList[indexPath.item]
    telepathyChoicecollectionCell.telepathyChoiceDefaultLabel.text = "\(indexPath.item + 1)"
    telepathyChoicecollectionCell.backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    telepathyChoicecollectionCell.layer.cornerRadius = 20
    telepathyChoicecollectionCell.clipsToBounds = true
    return telepathyChoicecollectionCell
  }
  // MARK: - Motion
  
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      UIView.animateKeyframes(
        withDuration: 1,
        delay: 0,
        options: .repeat,
        animations:  {
          UIView.addKeyframe(
            withRelativeStartTime: 0,
            relativeDuration: 0.5) {
              self.telepathyChoicecollectionView.backgroundColor = UIColor(red: 92/255, green: 42/255, blue: 157/255, alpha: 1)
              self.view.layoutIfNeeded()
          }
          UIView.addKeyframe(
            withRelativeStartTime: 0.5,
            relativeDuration: 0.5) {
              self.telepathyChoicecollectionView.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
              self.view.layoutIfNeeded()
          }
      })
    }
  }
}
// MARK: - UICollectionViewDelegate

extension TelepathyChoiceViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let checkIndex = telepathyChoicecollectionView.cellForItem(at: indexPath) as? TelepathyChoiceCollectionCell {
      checkIndex.telepathyChoiceLabel.isHidden = false
      checkIndex.telepathyChoiceDefaultLabel.isHidden = true
    }
  }
}

