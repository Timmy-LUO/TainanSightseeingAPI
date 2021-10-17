//
//  FoodResponse.swift
//  TainanSightseeingAPI
//
//  Created by 羅承志 on 2021/10/2.
//

import Foundation

struct FoodItem: Codable {
    let name: String? //店名
    let introduction: String? //介紹
    let address: String? //地址
}
