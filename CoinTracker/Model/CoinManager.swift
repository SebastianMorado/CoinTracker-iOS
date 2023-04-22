//
//  CoinManager.swift
//  CoinTracker
//
//  Created by Sebastian Morado on 3/28/23.
//

import Foundation
import ArkanaKeys

protocol CoinManagerDelegate {
    func didUpdateValueCoin(value: [[String]])
    func didUpdateValueCurrency(value: Double)
    func didFailWithError(error: Error?)
}

class CoinManager {
    
    let apiKey = Keys.Global().aPI_KEY
    
    var delegate : CoinManagerDelegate?

    func getCoinData() {
        
        if let url = URL(string: "https://api.coincap.io/v2/assets?limit=20"){
            let session = URLSession(configuration: .default)
            
            //get specific weather data from JSON
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error)
                    return
                }
                
                if let safeData = data {
                    let value = self.parseJSONCoin(from: safeData)
                    self.delegate?.didUpdateValueCoin(value: value)
                }
            }
            
            task.resume()
        }
    }
    
    func getCurrencyData() {
        
        if let url = URL(string: "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/USD/PHP"){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error)
                    return
                }
                
                if let safeData = data {
                    let value = self.parseJSONCurrency(from: safeData)
                    self.delegate?.didUpdateValueCurrency(value: value)
                }
            }
            
            task.resume()
        }
    }
    
    
    func parseJSONCoin(from data: Data) -> [[String]] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BaseData.self, from: data)
            return decodedData.data.map{ [$0.symbol, $0.priceUsd] }
        } catch {
            delegate?.didFailWithError(error: error)
            return []
        }
    }
    
    func parseJSONCurrency(from data: Data) -> Double {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: data)
            return decodedData.conversion_rate
        } catch {
            delegate?.didFailWithError(error: error)
            return 0.0
        }
    }
}
