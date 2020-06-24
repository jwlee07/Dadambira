//
//  TelepathyChoiceCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyChoiceCell: UITableViewCell {
  
  // MARK: - Property
  
  let telepathyChoiceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 30)
    label.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    label.alpha = 1
    label.textAlignment = .center
    return label
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupContentLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }

  
  // MARK: - setup Layout
  func setupContentLayout() {
    contentView.addSubview(telepathyChoiceLabel)
    telepathyChoiceLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      telepathyChoiceLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      telepathyChoiceLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
      telepathyChoiceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      telepathyChoiceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
