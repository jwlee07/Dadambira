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

var firstCheckIndexItenArr: [Int] = []
var secondCheckIndexItenArr: [Int] = []

var checkPersonNumberString: String = ""
var checkPersonNumberInt: Int = Int(checkPersonNumberString)!


