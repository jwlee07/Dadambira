//
//  HitAndMissGame.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HitAndMissGameViewController: UIViewController {
  
  // MARK: - ProPerty
  
  let numberImage = cardNumberImage
  let checkImage = cardCheckImage
  let hitAndMissLayout = UICollectionViewFlowLayout()
  lazy var hitAndMissCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: hitAndMissLayout)
  
  var toggle = true
  
  let infoLabel: UILabel = {
    let label = UILabel()
    label.text = "신중한 선택 !"
    label.font = UIFont.boldSystemFont(ofSize: 50)
    label.textColor = UIColor(red: 2621/255, green: 182/255, blue: 198/255, alpha: 1)
    return label
  }()
  
  let completeButton: UIButton = {
    let button = UIButton()
    button.setTitle("지정하기", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 120/255, green: 110/255, blue: 200/255, alpha: 0.4)
    button.addTarget(self, action: #selector(didTapSetUpButton), for: .touchUpInside)
    return button
  }()
  
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super .viewDidLoad()
    title = "날 맞춰봐잉"
    setupCollectionView()
    setupLabel()
    setupButton()
    setupNavigationBar()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    UIView.animate(withDuration: 0.5) {
      self.completeButton.center.x = -self.hitAndMissCollectionView.frame.width
    }
    UIView.animate(withDuration: 0.5, delay: 0.4, animations: {
      self.infoLabel.center.x = -self.hitAndMissCollectionView.frame.width
    })
  }
  
  // MARK: - Setup Layout
  
  func setupCollectionView() {
    let collectionWidth: CGFloat = (view.frame.width / 2) - 20
    let collectionHeight: CGFloat = view.frame.height / 4
    let collectionTop = view.frame.height / 3.5
    
    view.addSubview(hitAndMissCollectionView)
    hitAndMissLayout.itemSize = CGSize (width: collectionWidth, height: collectionHeight)
    hitAndMissLayout.minimumLineSpacing = 5
    hitAndMissLayout.minimumInteritemSpacing = 5
    hitAndMissLayout.sectionInset = UIEdgeInsets (top:collectionTop, left: 10, bottom: 10, right: 10)
    
    hitAndMissCollectionView.delegate = self
    hitAndMissCollectionView.dataSource = self
    hitAndMissCollectionView.backgroundColor = UIColor(red: 244/255, green: 238/255, blue: 255/255, alpha: 1)
    hitAndMissCollectionView.register(HitAndMissCell.self, forCellWithReuseIdentifier: "Custom")
  }
  
  func setupLabel() {
    hitAndMissCollectionView.addSubview(infoLabel)
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      infoLabel.topAnchor.constraint(equalTo: hitAndMissCollectionView.safeAreaLayoutGuide.topAnchor, constant: hitAndMissCollectionView.frame.height / 5.5),
      infoLabel.leadingAnchor.constraint(equalTo: hitAndMissCollectionView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      infoLabel.trailingAnchor.constraint(equalTo: hitAndMissCollectionView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
    infoLabel.textAlignment = .center
  }
  
  func setupButton() {
    hitAndMissCollectionView.addSubview(completeButton)
    completeButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      completeButton.topAnchor.constraint(equalTo: hitAndMissCollectionView.safeAreaLayoutGuide.topAnchor, constant: hitAndMissCollectionView.frame.height / 18),
      completeButton.leadingAnchor.constraint(equalTo: hitAndMissCollectionView.safeAreaLayoutGuide.leadingAnchor, constant: hitAndMissCollectionView.frame.width / 3),
      completeButton.trailingAnchor.constraint(equalTo: hitAndMissCollectionView.safeAreaLayoutGuide.trailingAnchor, constant: -hitAndMissCollectionView.frame.width / 3),
      completeButton.heightAnchor.constraint(equalToConstant: hitAndMissCollectionView.frame.height / 13)
    ])
  }
  
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1)
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  // MARK: - Setup Action
  
  @objc private func didTapSetUpButton(_ sender: UIButton) {
    if toggle {
      if firstCheckIndexItenArr.count > 0 {
        let selectOkAlert = UIAlertController (title: "마지막 확인 !", message: "\(firstCheckIndexItenArr[0] + 1)번 선택할까요 ?" , preferredStyle: .alert)
        let selectOkAlertAction = UIAlertAction (title: "넵 !", style: .default) {_ in
          self.infoLabel.text = "맞춰봐요 !"
          self.completeButton.setTitle("최종선택", for: .normal)
          self.hitAndMissCollectionView.reloadData()
          self.toggle = !self.toggle
        }
        let selectOkCancelAlertAction = UIAlertAction (title: "다시 !", style: .cancel)
        selectOkAlert.addAction(selectOkCancelAlertAction)
        selectOkAlert.addAction(selectOkAlertAction)
        present(selectOkAlert, animated: true)
      } else {
        let selectNoAlert = UIAlertController (title: "잠깐만!", message: "카드를 선택해주세요^^", preferredStyle: .alert)
        let selectNoAlertAction = UIAlertAction (title: "넵~", style: .default)
        selectNoAlert.addAction(selectNoAlertAction)
        present(selectNoAlert, animated: true)
      }
    } else {
      if firstCheckIndexItenArr.count > 0, secondCheckIndexItenArr.count > 0 {
        if firstCheckIndexItenArr[0] == secondCheckIndexItenArr[0] {
          let finalCompleteAlert = UIAlertController(title: "맞췄어요!", message: "축하드립니다 !", preferredStyle: .alert)
          let finalCompleteOk = UIAlertAction(title: "넵 !", style: .default) {_ in
            firstCheckIndexItenArr.removeAll()
            secondCheckIndexItenArr.removeAll()
            self.hitAndMissCollectionView.reloadData()
            self.toggle = !self.toggle
            self.completeButton.setTitle("지정하기", for: .normal)
            self.infoLabel.text = "신중한 선택!"
            
          }
          finalCompleteAlert.addAction(finalCompleteOk)
          present(finalCompleteAlert, animated: true)
        } else {
          let finalFailAlert = UIAlertController(title: "틀렸어요 !", message: "\(firstCheckIndexItenArr[0] + 1)번이었어요 ㅠ", preferredStyle: .alert)
          let finalFailOk = UIAlertAction (title: "넵 ㅠ", style: .default) {_ in
            firstCheckIndexItenArr.removeAll()
            secondCheckIndexItenArr.removeAll()
            self.hitAndMissCollectionView.reloadData()
            self.toggle = !self.toggle
            self.completeButton.setTitle("지정하기", for: .normal)
            self.infoLabel.text = "신중한 선택!"
          }
          finalFailAlert.addAction(finalFailOk)
          present(finalFailAlert, animated: true)
        }
      } else {
        let secondSelectNoAlert = UIAlertController (title: "잠깐만!", message: "카드를 선택해주세요^^", preferredStyle: .alert)
        let secondSelectNoAlertAction = UIAlertAction (title: "넵 ~", style: .default)
        secondSelectNoAlert.addAction(secondSelectNoAlertAction)
        present(secondSelectNoAlert, animated: true)
      }
    }
  }
  
  @objc private func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - Extension UICollectionView

extension HitAndMissGameViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    numberImage.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let hitAndImssHitAndMissCell = hitAndMissCollectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! HitAndMissCell
    hitAndImssHitAndMissCell.customImageView.alpha = 1
    hitAndImssHitAndMissCell.custimMiniImageView.alpha = 0
    hitAndImssHitAndMissCell.customImageView.image = numberImage[indexPath.item].withTintColor(UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1), renderingMode: .alwaysOriginal)
    hitAndImssHitAndMissCell.custimMiniImageView.image = cardCheckImage.withTintColor(UIColor(red: 221/255, green: 182/255, blue: 198/255, alpha: 1), renderingMode: .alwaysOriginal)
    return hitAndImssHitAndMissCell
  }
}
extension HitAndMissGameViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let checkDidIndexItem = hitAndMissCollectionView.cellForItem(at: indexPath) as? HitAndMissCell {
      if toggle {
        if checkDidIndexItem.isSelected {
          UIView.animate(withDuration: 0.5) {
            checkDidIndexItem.custimMiniImageView.alpha = 1
          }
          if !(firstCheckIndexItenArr.contains(indexPath.item)) {
            firstCheckIndexItenArr.append(indexPath.item)
          }
        }
      } else {
        if checkDidIndexItem.isSelected {
          UIView.animate(withDuration: 0.5) {
            checkDidIndexItem.custimMiniImageView.alpha = 1
          }
          if !(secondCheckIndexItenArr.contains(indexPath.item)) {
            secondCheckIndexItenArr.append(indexPath.item)
          }
        }
      }
    }
  }
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    if let checkDidDeIndexItem = hitAndMissCollectionView.cellForItem(at: indexPath) as? HitAndMissCell {
      if toggle {
        UIView.animate(withDuration: 0.5) {
          checkDidDeIndexItem.custimMiniImageView.alpha = 0
        }
        if firstCheckIndexItenArr.contains(indexPath.item) {
          firstCheckIndexItenArr.remove(at: 0)
        }
      } else {
        UIView.animate(withDuration: 0.5) {
          checkDidDeIndexItem.custimMiniImageView.alpha = 0
        }
        if secondCheckIndexItenArr.contains(indexPath.item) {
          secondCheckIndexItenArr.remove(at: 0)
        }
      }
    }
  }
}

