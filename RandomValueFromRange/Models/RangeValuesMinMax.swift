//
//  RangeValuesMinMax.swift
//  RandomValueFromRange
//
//  Created by Maxim Kucherov on 09.09.2021.
//

import Foundation

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
