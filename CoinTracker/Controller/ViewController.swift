//
//  ViewController.swift
//  CoinTracker
//
//  Created by Sebastian Morado on 3/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var currency: UISegmentedControl!
    @IBOutlet weak var coinPicker: UIPickerView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var moneyDisplay: UILabel!
    @IBOutlet weak var appName: UILabel!
    
    var coinManager = CoinManager()
    var coinData = [[String]]()
    var exchangeRate : Double = 0
    var isUSD : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinPicker.dataSource = self
        coinPicker.delegate = self
        coinManager.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //call
        loading.startAnimating()
        loading.isHidden = false
        appName.isHidden = true
        coinPicker.isHidden = true
        //call network search
        coinManager.getCoinData()
        coinManager.getCurrencyData()
    }
    
    

    @IBAction func pressRefresh(_ sender: UIButton) {
        loading.startAnimating()
        loading.isHidden = false
        appName.isHidden = true
        coinPicker.isHidden = true
        coinManager.getCoinData()
        coinManager.getCurrencyData()
    }
    
    @IBAction func changeCurrency(_ sender: UISegmentedControl) {
        isUSD.toggle()
    }
}

//MARK: - coin manager delegate

extension ViewController: CoinManagerDelegate {
    func didUpdateValueCoin(value: [[String]]) {
        coinData = value
        DispatchQueue.main.async {
            self.coinPicker.reloadAllComponents()
            self.loading.stopAnimating()
            self.loading.isHidden = true
            self.appName.isHidden = false
            self.coinPicker.isHidden = false
        }
        
    }
    
    func didUpdateValueCurrency(value: Double) {
        exchangeRate = value
    }
    
    func didFailWithError(error: Error?) {
        print(error!)
    }
}

//MARK: - Picker delegate and data source

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinData[row][0]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let raw = Double(coinData[row][1]) ?? 0
        let value = isUSD ? raw : raw * exchangeRate
        moneyDisplay.text = String(format: "%.4f", value)
    }
}

