//
//  CoinData.swift
//  CoinTracker
//
//  Created by Sebastian Morado on 3/28/23.
//
import Foundation

struct CoinData: Decodable{
    let id : String
    let symbol: String
    let priceUsd: String
}

struct BaseData: Decodable {
    let data: [CoinData]
}
