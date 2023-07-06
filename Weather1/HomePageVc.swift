//
//  ViewController.swift
//  Weather1
//
//  Created by AMG on 25/06/2023.
//

import UIKit
import Alamofire


class HomePageVc: UIViewController {
    
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    
    
    var cityId = "108410"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(getCity), name: NSNotification.Name("CityValueChange"), object: nil)
        
        getCityInfo()
        }
    
    
    
    func getCityInfo() {
        
        let params = ["id": cityId,"appid": "f862380e59ea865976d3b19020800eca"]
        self.loaderActivityIndicator.startAnimating()
        self.loaderActivityIndicator.isHidden = false
        AF.request("https://api.openweathermap.org/data/2.5/weather",parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON {  response in
            print(response.value)
            
            if let result = response.value {
                let jsonDictionary = result as! NSDictionary
                let main = jsonDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                
                
                self.loaderActivityIndicator.stopAnimating()
                self.loaderActivityIndicator.isHidden = true
                
                // Double Round
//                temp = temp - 272.15
                temp = Double(round(temp - 272.15))
                self.tempLable.text = "\(temp)º"
                
                var pressure = main["pressure"] as! Double
                self.pressureLbl.text = "\(pressure)"
                
                var humidity = main["humidity"] as! Double
                self.humidityLbl.text = "\(humidity)"
    }
    
}
    }
    
    @objc func getCity(notifcation: Notification) {
        if let city = notifcation.userInfo?["city"] as? City {
            
            cityNameLbl.text = city.name
            cityId = city.id
            getCityInfo()
}


    }
}

extension HomePageVc {
    
}
