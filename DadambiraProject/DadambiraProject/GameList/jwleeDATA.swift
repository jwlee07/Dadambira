//
//  jwleeDATA.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

let cardNumberImage: [UIImage] = [
  "1.square",
  "2.square",
  "3.square",
  "4.square"].compactMap(UIImage.init(systemName:))

let cardCheckImage: UIImage = UIImage(systemName: "heart.fill")!

let telepathCellImage = UIImage(systemName: "bubble.right.fill")?.withTintColor(UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0), renderingMode: .alwaysOriginal)

var firstCheckIndexItenArr: [Int] = []
var secondCheckIndexItenArr: [Int] = []

var checkPersonNumberString: String = ""

var checkTextfieldKeyword: [String] = []

var userList: [String] = []




